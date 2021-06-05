import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:map_booking_application/domain/models/password_model.dart';
import 'package:map_booking_application/domain/models/username_model.dart';
import 'package:map_booking_application/domain/repositories/authentication_repository.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required AuthenticationRepository userRepository})
      : _userRepository = userRepository,
        super(const LoginState());

  final AuthenticationRepository _userRepository;
  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    try {
      if (event is LoginUsernameChanged) {
        yield _mapUsernameChangedToState(event, state);
      } else if (event is LoginPasswordChanged) {
        yield _mapPasswordChangedToState(event, state);
      } else if (event is LoginSubmitted) {
        yield* _mapLoginSubmittedToState(event, state);
      }
    } catch (e) {}
  }

  LoginState _mapUsernameChangedToState(
    LoginUsernameChanged event,
    LoginState state,
  ) {
    final username = Username.dirty(event.username);
    return state.copyWith(
      username: username,
      formzStatus: Formz.validate([state.password, username]),
    );
  }

  LoginState _mapPasswordChangedToState(
    LoginPasswordChanged event,
    LoginState state,
  ) {
    final password = Password.dirty(event.password);
    return state.copyWith(
      password: password,
      formzStatus: Formz.validate([password, state.username]),
    );
  }

  Stream<LoginState> _mapLoginSubmittedToState(
    LoginSubmitted event,
    LoginState state,
  ) async* {
    if (state.formzStatus.isValidated) {
      yield state.copyWith(formzStatus: FormzStatus.submissionInProgress);
      try {
        await _userRepository.signInWithEmailAndPassword(
          email: state.username.value,
          password: state.password.value,
        );
        yield state.copyWith(formzStatus: FormzStatus.submissionSuccess);
      } on Exception catch (_) {
        yield state.copyWith(formzStatus: FormzStatus.submissionFailure);
      }
    }
  }
}
