import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../configs/app_colors.dart';
import '../../../configs/app_spacing.dart';
import '../../../utils/constants/string_constants.dart';
import '../../widgets/buttons/primary_button.dart';
import '../auth/authentication_screen.dart';

class RegisterButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final Map registerMap;

  const RegisterButton(
      {super.key, required this.formKey, required this.registerMap});

  Future<UserCredential?> registerUser(
      String email, String password, String fullName) async {
    try {
      // Register the user with FirebaseAuth
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Add user details to Firestore under 'users' collection
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'fullName': fullName,
        'email': email,
      });

      print("User registered successfully");
      return userCredential; // Returning UserCredential for further actions if needed
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('An account already exists for that email.');
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PrimaryButton(
          onPressed: () {
            print('register map--->$registerMap');
            if (formKey.currentState!.validate()) {
              registerUser(registerMap['email'], registerMap['password'],
                  '${registerMap['first_name']} ${registerMap['last_name']}');
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const HomeScreen(),
              //   ),
              // );
            }
          },
          buttonTitle: StringConstants.kRegister,
        ),
        InkWell(
          onTap: () {
            Navigator.pop(context);
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => AuthenticationScreen()));
          },
          child: const Padding(
            padding: EdgeInsets.only(top: spacingStandard),
            child: Text(
              'Already have an account? Sign in!',
              style: TextStyle(color: AppColors.blue),
            ),
          ),
        ),
      ],
    );
  }
}
