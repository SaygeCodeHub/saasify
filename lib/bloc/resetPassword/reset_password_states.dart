import 'package:saasify/data/models/authentication/forgot_password_model.dart';
import 'package:saasify/data/models/authentication/update_password_model.dart';

abstract class ResetPasswordStates {}

class InitialiseResetPasswordStates extends ResetPasswordStates {}

class PasswordResetting extends ResetPasswordStates {}

class PasswordReset extends ResetPasswordStates {
  final ForgotPasswordModel forgotPasswordModel;

  PasswordReset({required this.forgotPasswordModel});
}

class PasswordResettingFailed extends ResetPasswordStates {
  final String errorMessage;

  PasswordResettingFailed({required this.errorMessage});
}

class PasswordUpdating extends ResetPasswordStates {}

class PasswordUpdated extends ResetPasswordStates {
  final UpdatePasswordModel updatePasswordModel;

  PasswordUpdated({required this.updatePasswordModel});
}

class PasswordUpdatingFailed extends ResetPasswordStates {
  final String errorMessage;

  PasswordUpdatingFailed({required this.errorMessage});
}
