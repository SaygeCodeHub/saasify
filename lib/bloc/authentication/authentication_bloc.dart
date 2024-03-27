import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/authentication/authentication_event.dart';
import 'package:saasify/bloc/authentication/authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationState get initialState => AuthenticationInitial();

  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<AuthenticateUser>(_authenticateUser);
  }

  FutureOr<void> _authenticateUser(
      AuthenticateUser event, Emitter<AuthenticationState> emit) async {
    try {
      emit(AuthenticatingUser());
      if (event.authenticationMap['is_sign_in'] == true) {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: event.authenticationMap['email'],
          password: event.authenticationMap['password'],
        );
        User? user = FirebaseAuth.instance.currentUser;
        if (user!.uid.isNotEmpty) {
          FirebaseFirestore firestore = FirebaseFirestore.instance;
          await firestore.collection('users').doc(user.uid).set({
            'name': event.authenticationMap['email'],
            'email': event.authenticationMap['password'],
            'createdAt': FieldValue.serverTimestamp(),
          });
          emit(UserAuthenticated());
        } else {
          emit(UserNotAuthenticated(
              errorMessage: 'Could not authenticate user. Please try again!'));
        }
      } else {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: event.authenticationMap['email'],
            password: event.authenticationMap['password']);

        User? user = FirebaseAuth.instance.currentUser;
        if (user!.uid.isNotEmpty) {
          FirebaseFirestore firestore = FirebaseFirestore.instance;
          await firestore.collection('users').doc(user.uid).set({
            'name': event.authenticationMap['email'],
            'email': event.authenticationMap['password'],
            'createdAt': FieldValue.serverTimestamp(),
          });
          emit(UserAuthenticated());
        } else {
          emit(UserNotAuthenticated(
              errorMessage: 'Could not authenticate user. Please try again!'));
        }
      }
    } catch (e) {
      emit(UserNotAuthenticated(
          errorMessage: 'Could not authenticate user. Please try again!'));
    }
  }
}
