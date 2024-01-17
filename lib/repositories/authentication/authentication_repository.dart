import 'package:saasify/data/models/authentication/authentication_model.dart';

abstract class AuthenticationRepository {
  Future<AuthenticateUserModel> authenticateUser(Map userDetailsMap);
}
