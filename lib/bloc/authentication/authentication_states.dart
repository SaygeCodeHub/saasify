import 'package:saasify/data/models/authentication/authentication_model.dart';

abstract class AuthenticationStates {}

class AuthenticationInitial extends AuthenticationStates {}

class AuthenticationFormLoaded extends AuthenticationStates {
  final String focusField;
  final bool isLogin;

  AuthenticationFormLoaded({required this.focusField, required this.isLogin});
}

class OtpLoading extends AuthenticationStates {}

class OtpReceived extends AuthenticationStates {
  final String verificationId;
  final String userName;

  OtpReceived({required this.verificationId, required this.userName});
}

class PhoneOtpVerified extends AuthenticationStates {
  final UserData userData;

  PhoneOtpVerified({required this.userData});
}

class PhoneAuthError extends AuthenticationStates {
  final String error;

  PhoneAuthError({required this.error});
}

class IsLoggedIn extends AuthenticationStates {}

class LoggedOut extends AuthenticationStates {}
