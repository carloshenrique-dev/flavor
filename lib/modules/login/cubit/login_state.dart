part of 'login_cubit.dart';

class LoginState extends Equatable {
  final ScreenStatus status;
  final String errorMessage;

  const LoginState._({
    required this.errorMessage,
    required this.status,
  });

  const LoginState.initial()
      : this._(
          status: ScreenStatus.initial,
          errorMessage: '',
        );

  @override
  List<Object?> get props => [
        status,
        errorMessage,
      ];

  LoginState copyWith({
    ScreenStatus? status,
    String? errorMessage,
  }) {
    return LoginState._(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
