import 'package:saasify/data/models/authentication/authenticate_user_model.dart';

abstract class AuthStates {}

class InitialiseAuthStates extends AuthStates {}

class CheckingLoggedInSession extends AuthStates {}

class ActiveSession extends AuthStates {}

class InactiveSession extends AuthStates {}

class NoCompanySelected extends AuthStates {}

class LogoutSession extends AuthStates {}

class UserAuthenticated extends AuthStates {
  final AuthenticateUserData authenticateUserData;

  UserAuthenticated({required this.authenticateUserData});
}

class AuthenticatingUser extends AuthStates {}

class FailedToAuthenticateUser extends AuthStates {
  final String? errorMessage;

  FailedToAuthenticateUser({this.errorMessage});
}
