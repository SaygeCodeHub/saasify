import 'package:saasify/data/models/register/register_user_model.dart';

abstract class RegisterRepository {
  Future<RegisterUserModel> registerUser(Map userDetailsMap);
}
