abstract class ResetPasswordEvents {}

class SendVerificationLink extends ResetPasswordEvents {
  final Map userDetails;

  SendVerificationLink({required this.userDetails});
}

class SendForgotPasswordLink extends ResetPasswordEvents {
  SendForgotPasswordLink();
}

class UpdatePasswordLink extends ResetPasswordEvents {
  UpdatePasswordLink();
}
