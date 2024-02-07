abstract class ResetPasswordEvents {}

class SendForgotPasswordLink extends ResetPasswordEvents {
  SendForgotPasswordLink();
}

class UpdatePasswordLink extends ResetPasswordEvents {
  UpdatePasswordLink();
}
