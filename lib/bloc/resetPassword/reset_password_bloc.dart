import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/resetPassword/reset_password_events.dart';
import 'package:saasify/bloc/resetPassword/reset_password_states.dart';
import 'package:saasify/caches/cache.dart';
import 'package:saasify/di/app_module.dart';

class AuthBloc extends Bloc<ResetPasswordEvents, ResetPasswordStates> {
  final Cache cache = getIt<Cache>();
  final Map userInputAuthenticationMap = {};

  ResetPasswordStates get initialState => InitialiseResetPasswordStates();

  AuthBloc() : super(InitialiseResetPasswordStates()) {
    on<SendVerificationLink>(_sendVerificationLink);
  }

  FutureOr<void> _sendVerificationLink(
      SendVerificationLink event, Emitter<ResetPasswordStates> emit) async {
    try {

    } catch (e) {
      emit(FailedToSendVerificationLink());
    }
  }
}
