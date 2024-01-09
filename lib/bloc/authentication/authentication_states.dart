import 'package:saasify/data/models/authentication/authentication_model.dart';

abstract class AuthenticationStates {}

class AuthenticationInitial extends AuthenticationStates {}

class AuthenticationFormLoaded extends AuthenticationStates {}

class TextFieldChanged extends AuthenticationStates {}

class AuthenticationLoading extends AuthenticationStates {}

class AuthenticationError extends AuthenticationStates {
  final String error;

  AuthenticationError({required this.error});
}

class AuthenticationSuccess extends AuthenticationStates {
  final AuthenticationModel authenticationModel;

  AuthenticationSuccess({required this.authenticationModel});
}

class AuthenticationSuccessNoBackend extends AuthenticationStates {}

class IsLoggedIn extends AuthenticationStates {}

class LoggedOut extends AuthenticationStates {}

// OTP Logic

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
