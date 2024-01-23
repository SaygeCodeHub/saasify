abstract class RegisterEvents {}

class RegisterUser extends RegisterEvents {
  final Map userDetails;

  RegisterUser({required this.userDetails});
}
