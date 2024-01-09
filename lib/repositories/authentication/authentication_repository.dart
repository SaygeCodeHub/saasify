import 'package:firebase_auth/firebase_auth.dart';
import 'package:saasify/data/models/authentication/authentication_model.dart';

abstract class AuthenticationRepository {
  Future<void> verifyPhoneNumber(
      {required String phoneNumber,
      required Function(PhoneAuthCredential) verificationCompleted,
      required Function(FirebaseAuthException) verificationFailed,
      required Function(String, int?) codeSent,
      required Function(String) codeAutoRetrievalTimeout});

  Future<UserCredential> signIn(String email, String password);

  Future<Map> fetchModules(String id);

  Future<AuthenticationModel> authenticateUser(Map userDetailsMap);
}
