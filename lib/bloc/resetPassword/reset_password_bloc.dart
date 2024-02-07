import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/resetPassword/reset_password_events.dart';
import 'package:saasify/bloc/resetPassword/reset_password_states.dart';
import 'package:saasify/caches/cache.dart';
import 'package:saasify/data/models/authentication/forgot_password_model.dart';
import 'package:saasify/data/models/authentication/update_password_model.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/repositories/authentication/authentication_repository.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvents, ResetPasswordStates> {
  final Cache cache = getIt<Cache>();
  final Map userInputAuthenticationMap = {};
  final AuthenticationRepository _authenticationRepository =
      getIt<AuthenticationRepository>();

  ResetPasswordStates get initialState => InitialiseResetPasswordStates();

  ResetPasswordBloc() : super(InitialiseResetPasswordStates()) {
    on<SendForgotPasswordLink>(_sendForgotPasswordLink);
    on<UpdatePasswordLink>(_updatePasswordLink);
  }

  FutureOr<void> _sendForgotPasswordLink(
      SendForgotPasswordLink event, Emitter<ResetPasswordStates> emit) async {
    emit(PasswordResetting());
    try {
      Map resetPasswordMap = userInputAuthenticationMap;

      ForgotPasswordModel forgotPasswordModel =
          await _authenticationRepository.forgotUserPassword(resetPasswordMap);

      if (forgotPasswordModel.status == 200) {
        emit(PasswordReset(forgotPasswordModel: forgotPasswordModel));
      } else {
        emit(
            PasswordResettingFailed(errorMessage: forgotPasswordModel.message));
      }
    } catch (e) {
      emit(PasswordResettingFailed(errorMessage: e.toString()));
    }
  }

  FutureOr<void> _updatePasswordLink(
      UpdatePasswordLink event, Emitter<ResetPasswordStates> emit) async {
    emit(PasswordUpdating());
    try {
      Map updatePasswordMap = userInputAuthenticationMap;
      UpdatePasswordModel updatePasswordModel =
          await _authenticationRepository.updateUserPassword(updatePasswordMap);
      if (updatePasswordModel.status == 200) {
        emit(PasswordUpdated(updatePasswordModel: updatePasswordModel));
      } else {
        emit(PasswordUpdatingFailed(
            errorMessage: updatePasswordModel.message.toString()));
      }
    } catch (e) {
      emit(PasswordUpdatingFailed(errorMessage: e.toString()));
    }
  }
}
