import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/auth/auth_events.dart';
import 'package:saasify/bloc/auth/auth_states.dart';
import 'package:saasify/data/models/authentication/authentication_model.dart';

import '../../di/app_module.dart';
import '../../repositories/authentication/authentication_repository.dart';

class AuthBloc extends Bloc<AuthEvents, AuthStates> {
  final AuthenticationRepository _authenticationRepository =
      getIt<AuthenticationRepository>();
  final Map userInputAuthenticationMap = {};
  AuthStates get initialState => InitialiseAuthStates();

  AuthBloc() : super(InitialiseAuthStates()) {
    on<RegisterUser>(_registerUser);
    on<AuthenticateUser>(_authenticateUser);
  }

  FutureOr<void> _registerUser(
      RegisterUser event, Emitter<AuthStates> emit) async {
    emit(RegisteringUser());
  }

  FutureOr<void> _authenticateUser(
      AuthenticateUser event, Emitter<AuthStates> emit) async {
    emit(AuthenticatingUser());
    try {
      AuthenticateUserModel authenticateUserModel =
          await _authenticationRepository.authenticateUser(event.userDetails);
      if (authenticateUserModel.status == '200') {
        emit(UserAuthenticated());
      } else {
        emit(FailedToAuthenticateUser(
            errorMessage: authenticateUserModel.message));
      }
    } catch (e) {
      emit(FailedToAuthenticateUser());
    }
  }
}
