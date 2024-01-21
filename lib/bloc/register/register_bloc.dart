import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/register/register_events.dart';
import 'package:saasify/bloc/register/register_states.dart';
import 'package:saasify/caches/cache.dart';
import 'package:saasify/data/models/authentication/authenticate_user_model.dart';
import 'package:saasify/di/app_module.dart';

class RegisterBloc extends Bloc<RegisterEvents, RegisterStates> {
  final Cache cache = getIt<Cache>();
  final Map userInputAuthenticationMap = {};

  RegisterStates get initialState => InitialiseRegisterStates();

  RegisterBloc() : super(InitialiseRegisterStates()) {
    on<RegisterUser>(_registerUser);
  }

  FutureOr<void> _registerUser(
      RegisterUser event, Emitter<RegisterStates> emit) async {
    emit(RegisteringUser());
  }

  saveUserSelections(AuthenticateUserData authenticateUserData) async {
    cache.setUserLoggedIn(true);
    if (authenticateUserData.company.length <= 1) {
      getIt<Cache>()
          .setCompanyId(authenticateUserData.company[0].companyId as String);
      if (authenticateUserData.company[0].branches.length <= 1) {
        getIt<Cache>()
            .setBranchId(authenticateUserData.company[0].branches[0] as String);
      }
    }
  }
}
