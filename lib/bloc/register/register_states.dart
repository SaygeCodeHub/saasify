import 'package:saasify/data/models/register/register_user_model.dart';

abstract class RegisterStates {}

class InitialiseRegisterStates extends RegisterStates {}

class RegisteringUser extends RegisterStates {}

class UserRegistered extends RegisterStates {
  RegisterData registerData;
  UserRegistered({required this.registerData});
}

class FailedToRegisterUser extends RegisterStates {
  final String? errorMessage;

  FailedToRegisterUser({this.errorMessage});
}
