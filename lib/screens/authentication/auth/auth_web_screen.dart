import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/authentication/authentication_bloc.dart';
import 'package:saasify/bloc/authentication/authentication_event.dart';
import 'package:saasify/bloc/authentication/authentication_state.dart';
import 'package:saasify/screens/companyDetails/register_company_screen.dart';
import 'package:saasify/screens/home/home_screen.dart';
import 'package:saasify/screens/skeleton_screen.dart';
import 'package:saasify/screens/widgets/buttons/primary_button.dart';
import 'package:saasify/screens/widgets/lable_and_textfield_widget.dart';
import 'package:saasify/utils/authentication_validators.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/utils/custom_dialogs.dart';

import '../../../configs/app_colors.dart';
import '../../../configs/app_spacing.dart';

class AuthWebScreen extends StatefulWidget {
  const AuthWebScreen({super.key});

  @override
  State<AuthWebScreen> createState() => _AuthWebScreenState();
}

class _AuthWebScreenState extends State<AuthWebScreen> {
  final formKey = GlobalKey<FormState>();
  final Map authenticationMap = {};

  bool isSignIn = true;

  @override
  Widget build(BuildContext context) {
    return SkeletonScreen(
        appBarTitle: 'Saasify',
        bodyContent: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: _buildFormBody(context),
          ),
        ),
        bottomBarButtons: const []);
  }

  Widget _buildFormBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        LabelAndTextFieldWidget(
          prefixIcon: const Icon(Icons.email_outlined),
          label: StringConstants.kEmailAddress,
          isRequired: true,
          initialValue: authenticationMap['email'] ?? '',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is required';
            }
            return null;
          },
          onTextFieldChanged: (value) {
            authenticationMap['email'] = value;
          },
        ),
        const SizedBox(height: spacingMedium),
        LabelAndTextFieldWidget(
          prefixIcon: const Icon(Icons.password_outlined),
          label: StringConstants.kPassword,
          isRequired: true,
          initialValue: authenticationMap['password'] ?? '',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is required';
            } else if (AuthenticationValidators().isValidPassword(value)) {
              return 'Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, one number, and one special character';
            }
            return null;
          },
          onTextFieldChanged: (value) {
            authenticationMap['password'] = value;
          },
        ),
        const SizedBox(height: spacingXXXLarge),
        BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            if (state is AuthenticatingUser) {
              const CircularProgressIndicator();
            } else if (state is UserAuthenticated) {
              if (isSignIn) {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return CustomDialogs().showSuccessDialog(
                          context, 'User signed-in successfully',
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen())));
                    });
              } else {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return CustomDialogs().showSuccessDialog(
                          context, 'User registered successfully!',
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const RegisterCompanyWebScreen())));
                    });
              }
            } else if (state is UserNotAuthenticated) {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomDialogs().showAlertDialog(
                        context, state.errorMessage,
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const RegisterCompanyWebScreen())));
                  });
            }
          },
          child: PrimaryButton(
            buttonTitle: (isSignIn) ? 'Sign in' : 'Register',
            onPressed: () {
              if (formKey.currentState!.validate()) {
                context.read<AuthenticationBloc>().add(
                    AuthenticateUser(authenticationMap: authenticationMap));
              }
            },
          ),
        ),
        const SizedBox(height: spacingMedium),
        Center(
          child: InkWell(
            onTap: () {
              setState(() {
                authenticationMap.clear();
                isSignIn = !isSignIn;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(top: spacingStandard),
              child: Text(
                (isSignIn)
                    ? 'Create a new account. Register!'
                    : 'Already have an account? Sign in!',
                style: const TextStyle(color: AppColors.blue),
              ),
            ),
          ),
        )
      ],
    );
  }
}
