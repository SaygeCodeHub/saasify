import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseUserAuthentication {
  Future<bool> registerUser(
      String email, String password, String fullName) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'fullName': fullName,
        'email': email,
      });

      userCredential.user!.uid;
      print("User registered successfully");
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('An account already exists for that email.');
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> signInUser(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("User signed in successfully");
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      } else {
        print('FirebaseAuthException: ${e.message}');
      }
      return false;
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }
}
