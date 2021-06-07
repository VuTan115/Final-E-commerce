import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:map_booking_application/domain/models/user_model.dart';
import 'package:map_booking_application/infrastructure/repositories/authentication_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(AuthenticationInitial());

  final AuthenticationRepository _authenticationRepository;
  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    try {
      if (event is AuthenticationStarted) {
        yield AuthenticationInProgress();
      }
      if (event is AuthenticationLoggedIn) {
        final UserModel _user = UserModel(uid: "123");
        yield AuthenticationSuccess(userModel: _user);
      }
      if (event is AuthenticationLoggedOut) {
        yield AuthenticationFailure();
      }
    } catch (e) {}
  }

  // // AuthenticationStarted
  // Stream<AuthenticationState> _mapAuthenticationInitialToState() async* {
  //   yield AuthenticationInitial();
  // }

  // // AuthenticationStarted
  // Stream<AuthenticationState> _mapAuthenticationStartedToState() async* {
  //   yield AuthenticationInProgress();
  // }

  // //AuthenticationLoggedIn
  // Stream<AuthenticationState> _mapAuthenticationLoggedInToState() async* {
  //   yield AuthenticationSuccess();
  // }

  // //AuthenticationLoggedOut
  // Stream<AuthenticationState> _mapAuthenticationLoggedOutInToState() async* {
  //   yield AuthenticationFailure();
  // }
}
