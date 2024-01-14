import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/authentication/authentication_bloc.dart';
import 'package:saasify/bloc/authentication/authentication_event.dart';

void onEmailChanged(String value, BuildContext context) {
  context.read<AuthenticationBloc>().add(TextFieldChange());
  context.read<AuthenticationBloc>().authDetails["email"] = value;
}

void onPasswordChanged(String value, BuildContext context) {
  context.read<AuthenticationBloc>().add(TextFieldChange());
  context.read<AuthenticationBloc>().authDetails["password"] = value;
}
