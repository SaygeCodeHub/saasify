import 'package:saasify/data/models/authentication/authenticate_user_model.dart';

abstract class AuthenticationRepository {
  Future<AuthenticateUserModel> authenticateUser(Map userDetailsMap);
}
