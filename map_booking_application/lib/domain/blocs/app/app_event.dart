part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AppEvent {}

class AppLogoutRequested extends AppEvent {}

class AppUserChanged extends AppEvent {
  const AppUserChanged(this.user);

  final UserModel user;

  @override
  List<Object> get props => [user];
}
