part of 'app_bloc.dart';

enum AppStatus {
  authenticated,
  unauthenticated,
}

abstract class AppState extends Equatable {
  const AppState();
  // const AppState._({
  //   required this.status,
  //   this.user = UserModel.empty,
  // });

  // const AppState.authenticated(UserModel user)
  //     : this._(status: AppStatus.authenticated, user: user);

  // const AppState.unauthenticated() : this._(status: AppStatus.unauthenticated);

  // final AppStatus status;
  // final UserModel user;

  @override
  List<Object> get props => [];
}

class AppLoadInitial extends AppState {}

class AppLoadSuccess extends AppState {}

class AppLoadFailure extends AppState {
  final _error;
  AppLoadFailure(this._error);
}

class AppLoadInProgress extends AppState {}
