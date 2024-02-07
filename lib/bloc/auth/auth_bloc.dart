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
    on<AuthenticateUser>(_authenticateUser);
    on<CheckActiveSession>(_checkActiveSession);
  }

  FutureOr<void> _checkActiveSession(
      CheckActiveSession event, Emitter<AuthStates> emit) async {
    try {
      bool? isLoggedIn = await cache.isLoggedIn();
      var companyId = await cache.getCompanyId();
      if (isLoggedIn == true) {
        if (companyId != '' || companyId.isNotEmpty) {
          emit(ActiveSession());
        } else {
          emit(NoCompanySelected());
        }
      } else {
        emit(InactiveSession());
      }
    } catch (e) {
      emit(InactiveSession());
    }
  }

  FutureOr<void> _authenticateUser(
      AuthenticateUser event, Emitter<AuthStates> emit) async {
    emit(AuthenticatingUser());
    try {
      AuthenticateUserModel authenticateUserModel =
          await _authenticationRepository.authenticateUser(event.userDetails);
      if (authenticateUserModel.status == 200) {
        await saveUserSelections(authenticateUserModel.data);
        emit(UserAuthenticated(
            authenticateUserData: authenticateUserModel.data));
      } else {
        emit(FailedToAuthenticateUser(
            errorMessage: authenticateUserModel.message));
      }
    } catch (e) {
      emit(FailedToAuthenticateUser());
    }
  }

  saveUserSelections(AuthenticateUserData authenticateUserData) async {
    getIt<Cache>().setUserId(authenticateUserData.userId.toString());
    cache.setUserLoggedIn(true);
    if (authenticateUserData.company.isNotEmpty) {
      getIt<Cache>()
          .setCompanyId(authenticateUserData.company[0].companyId.toString());
      if (authenticateUserData.company[0].branches.length <= 1) {
        getIt<Cache>().setBranchId(
            authenticateUserData.company[0].branches[0].toString());
        List<int> intList =
            authenticateUserData.company[0].branches[0].designations;
        List<String> stringList =
            intList.map((int number) => number.toString()).toList();
        getIt<Cache>().setRole(stringList);
      }
    }
  }
}
