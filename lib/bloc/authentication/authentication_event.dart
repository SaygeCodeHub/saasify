import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationEvents {}

class TextFieldChange extends AuthenticationEvents {
  final String focusField;
  final bool isLogin;

  TextFieldChange({required this.focusField, required this.isLogin});
}

class GetOtp extends AuthenticationEvents {}

class SwitchAuthentication extends AuthenticationEvents {
  final String focusField;
  final bool isLogin;

  SwitchAuthentication({required this.focusField, required this.isLogin});
}

class OtpReceivedOnPhone extends AuthenticationEvents {
  final String verificationId;
  final int? token;

  OtpReceivedOnPhone({required this.verificationId, required this.token});
}

class VerifyOtp extends AuthenticationEvents {
  final String otpCode;
  final String verificationId;

  VerifyOtp({required this.otpCode, required this.verificationId});
}

class OtpVerified extends AuthenticationEvents {
  final AuthCredential credential;
  final String userName;

  OtpVerified({required this.credential, required this.userName});
}

class OtpVerificationError extends AuthenticationEvents {
  final String error;

  OtpVerificationError({required this.error});
}

class CheckIfLoggedIn extends AuthenticationEvents {}

class LogOut extends AuthenticationEvents {}
