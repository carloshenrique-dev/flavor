import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavor/core/repositories/login_repository.dart';
import 'package:get_it/get_it.dart';

import '../../modules/login/cubit/login_cubit.dart';
import '../repositories/login_repository_impl.dart';
import 'login_service.dart';
import 'login_service_impl.dart';

final di = GetIt.instance;

Future<void> initServiceLocator() async {
  di.registerFactory<FirebaseAuth>(
    () => FirebaseAuth.instance,
  );

  di.registerFactory<FirebaseFirestore>(
    () => FirebaseFirestore.instance,
  );

  di.registerFactory<LoginRepository>(
    () => LoginRepositoryImpl(
      firestore: di<FirebaseFirestore>(),
    ),
  );

  di.registerFactory<LoginService>(
    () => LoginServiceImpl(
      loginRepository: di<LoginRepository>(),
    ),
  );

  di.registerFactory<LoginCubit>(
    () => LoginCubit(
      loginService: di<LoginService>(),
      firebaseAuthInstance: di<FirebaseAuth>(),
    ),
  );
}
