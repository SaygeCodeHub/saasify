import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/auth/auth_events.dart';
import 'package:saasify/bloc/auth/auth_states.dart';
import 'package:saasify/data/models/authentication/authenticate_user_model.dart';

import '../../caches/cache.dart';
import '../../di/app_module.dart';
import '../../repositories/authentication/authentication_repository.dart';

class AuthBloc extends Bloc<AuthEvents, AuthStates> {
  final AuthenticationRepository _authenticationRepository =
      getIt<AuthenticationRepository>();
  final Cache cache = getIt<Cache>();
  final Map userInputAuthenticationMap = {};

  AuthStates get initialState => InitialiseAuthStates();

  AuthBloc() : super(InitialiseAuthStates()) {
    on<RegisterUser>(_registerUser);
    on<AuthenticateUser>(_authenticateUser);
    on<CheckActiveSession>(_checkActiveSession);
  }

  FutureOr<void> _checkActiveSession(
      CheckActiveSession event, Emitter<AuthStates> emit) async {
    try {
      bool? isLoggedIn = await cache.isLoggedIn();
      if (isLoggedIn == true) {
        emit(ActiveSession());
      } else {
        emit(InactiveSession());
      }
    } catch (e) {
      emit(InactiveSession());
    }
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
        cache.setUserLoggedIn(true);
        cache.saveUserLoginDetails(authenticateUserModel.data!);
        emit(UserAuthenticated(
            authenticateUserData: authenticateUserModel.data!));
      } else {
        emit(FailedToAuthenticateUser(
            errorMessage: authenticateUserModel.message));
      }
    } catch (e) {
      emit(FailedToAuthenticateUser());
    }
  }
}
