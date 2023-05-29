import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavor/core/models/user_data.dart';
import 'package:flavor/core/services/login_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../core/consts.dart';
import '../../../firebase_options.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginService _loginService;
  final FirebaseAuth _firebaseAuthInstance;

  LoginCubit({
    required LoginService loginService,
    required FirebaseAuth firebaseAuthInstance,
  })  : _loginService = loginService,
        _firebaseAuthInstance = firebaseAuthInstance,
        super(const LoginState.initial());

  Future<void> signInWithGoogle() async {
    try {
      emit(state.copyWith(status: ScreenStatus.loading));
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn(
        clientId: Platform.isAndroid
            ? DefaultFirebaseOptions.currentPlatform.androidClientId
            : DefaultFirebaseOptions.currentPlatform.iosClientId,
      ).signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      if (googleAuth != null && googleUser != null) {
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final signInResult =
            await _firebaseAuthInstance.signInWithCredential(credential);

        if (signInResult.credential != null) {
          final result = await _loginService.login(
            UserData(
              name: googleUser.displayName,
              id: googleUser.id,
              email: googleUser.email,
            ),
          );
          if (result) {
            emit(state.copyWith(status: ScreenStatus.completed));
          } else {
            emit(state.copyWith(
              status: ScreenStatus.error,
              errorMessage: 'Error to register your user, try again',
            ));
          }
        }
      } else {
        emit(state.copyWith(
          status: ScreenStatus.error,
        ));
      }
    } catch (e) {
      log(e.toString());
      emit(state.copyWith(
          status: ScreenStatus.error, errorMessage: e.toString()));
    }
  }

  void reset() {
    emit(state.copyWith(errorMessage: '', status: ScreenStatus.initial));
  }
}
