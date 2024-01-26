abstract class ResetPasswordStates {}

class InitialiseResetPasswordStates extends ResetPasswordStates {}

class SendingVerificationLink extends ResetPasswordStates {}

class FailedToSendVerificationLink extends ResetPasswordStates {}

class VerificationLinkSent extends ResetPasswordStates {}

class PasswordResetting extends ResetPasswordStates {}

class PasswordReset extends ResetPasswordStates {}

class PasswordResettingFailed extends ResetPasswordStates {}
