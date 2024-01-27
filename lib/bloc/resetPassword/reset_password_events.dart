abstract class ResetPasswordEvents {}

class SendVerificationLink extends ResetPasswordEvents {
  final Map userDetails;

  SendVerificationLink({required this.userDetails});
}
