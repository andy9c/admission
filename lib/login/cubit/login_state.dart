part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzStatus.pure,
    this.openTimer = "Loading ...",
    this.closeTimer = "Loading ...",
  });

  final Email email;
  final Password password;
  final FormzStatus status;
  final String openTimer;
  final String closeTimer;

  @override
  List<Object> get props {
    return [
      email,
      password,
      status,
      openTimer,
      closeTimer,
    ];
  }

  LoginState copyWith({
    Email? email,
    Password? password,
    FormzStatus? status,
    String? openTimer,
    String? closeTimer,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      openTimer: openTimer ?? this.openTimer,
      closeTimer: closeTimer ?? this.closeTimer,
    );
  }
}
