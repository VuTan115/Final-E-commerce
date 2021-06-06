import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:map_booking_application/domain/blocs/components/authentication/authentication_bloc.dart';
import 'package:map_booking_application/domain/models/user_model.dart';
import 'package:map_booking_application/domain/repositories/authentication_repository.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(AppLoadInitial());
  // super(
  //   authenticationRepository.currentUser.uid == ''
  //       ? AppState.authenticated(authenticationRepository.currentUser)
  //       : const AppState.unauthenticated(),
  // );
  final AuthenticationRepository _authenticationRepository;
  @override
  Stream<AppState> mapEventToState(
    AppEvent event,
  ) async* {
    try {
      yield AppLoadInProgress();
      yield AppLoadSuccess();
    } catch (error) {
      yield AppLoadFailure(error);
    }
  }
}
