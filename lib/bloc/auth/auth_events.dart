abstract class AuthEvents {}

class AuthenticateUser extends AuthEvents {
  final Map userDetails;

  AuthenticateUser({required this.userDetails});
}

class CheckActiveSession extends AuthEvents {}

class LogoutSession extends AuthEvents {}
