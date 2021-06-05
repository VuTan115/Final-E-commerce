part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationInProgress extends AuthenticationState {}

class AuthenticationSuccess extends AuthenticationState {
  final UserModel _userModel;
  const AuthenticationSuccess(this._userModel);
}

class AuthenticationFailure extends AuthenticationState {}
