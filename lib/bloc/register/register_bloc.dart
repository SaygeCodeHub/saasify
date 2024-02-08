import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/register/register_events.dart';
import 'package:saasify/bloc/register/register_states.dart';
import 'package:saasify/caches/cache.dart';
import 'package:saasify/data/models/register/register_user_model.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/repositories/register/register_repository.dart';

class RegisterBloc extends Bloc<RegisterEvents, RegisterStates> {
  final Cache cache = getIt<Cache>();
  final Map userInputAuthenticationMap = {};
  final RegisterRepository _registerRepository = getIt<RegisterRepository>();

  RegisterStates get initialState => InitialiseRegisterStates();

  RegisterBloc() : super(InitialiseRegisterStates()) {
    on<RegisterUser>(_registerUser);
  }

  FutureOr<void> _registerUser(
      RegisterUser event, Emitter<RegisterStates> emit) async {
    emit(RegisteringUser());
    try {
      RegisterUserModel registerUserModel =
          await _registerRepository.registerUser(event.userDetails);
      if (registerUserModel.status == 200) {
        emit(UserRegistered(registerData: registerUserModel.data));
      } else {
        emit(FailedToRegisterUser(errorMessage: registerUserModel.message));
      }
    } catch (e) {
      emit(FailedToRegisterUser(errorMessage: e.toString()));
    }
  }
}
