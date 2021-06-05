part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.username = const Username.pure(),
    this.password = const Password.pure(),
    this.formzStatus = FormzStatus.pure,
  });
  final Username username;
  final Password password;
  final FormzStatus formzStatus;

  LoginState copyWith({
    FormzStatus? formzStatus,
    Username? username,
    Password? password,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      formzStatus: formzStatus ?? this.formzStatus,
    );
  }

  @override
  List<Object> get props => [username, password, formzStatus];
}
