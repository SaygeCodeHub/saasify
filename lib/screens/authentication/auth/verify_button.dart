import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../configs/app_colors.dart';
import '../../../configs/app_spacing.dart';
import '../../../utils/constants/string_constants.dart';
import '../../widgets/buttons/primary_button.dart';
import '../register/register_screen.dart';

class AuthVerifyButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final Map authenticationMap;

  const AuthVerifyButton(
      {super.key, required this.formKey, required this.authenticationMap});

  Future<UserCredential?> signInUser(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("User signed in successfully");
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      } else {
        print('FirebaseAuthException: ${e.message}');
      }
      return null;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PrimaryButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              signInUser(authenticationMap['email'].toString(),
                  authenticationMap['password'].toString());
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const HomeScreen(),
              //   ),
              // );
            }
          },
          buttonTitle: StringConstants.kSignUp,
        ),
        const SizedBox(height: spacingStandard),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: spacingStandard),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RegisterScreen(),
                ),
              );
            },
            child: const Text(
              'New user? Create an account!',
              style: TextStyle(color: AppColors.blue),
            ),
          ),
        ),
      ],
    );
  }
}
