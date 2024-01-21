abstract class AuthEvents {}

class RegisterUser extends AuthEvents {
  final Map userDetails;

  RegisterUser({required this.userDetails});
}

class AuthenticateUser extends AuthEvents {
  final Map userDetails;

  AuthenticateUser({required this.userDetails});
}

class CheckActiveSession extends AuthEvents {}

class LogoutSession extends AuthEvents {}
