import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/auth/auth_bloc.dart';
import 'package:saasify/bloc/auth/auth_events.dart';
import 'package:saasify/bloc/auth/auth_states.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/screens/authentication/register_screen.dart';
import 'package:saasify/screens/companies/all_companies_screen.dart';
import '../../../../configs/app_spacing.dart';
import '../../../../utils/constants/string_constants.dart';
import '../../../../widgets/buttons/primary_button.dart';

class AuthVerifyButton extends StatelessWidget {
  const AuthVerifyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocConsumer<AuthBloc, AuthStates>(listener: (context, state) {
          if (state is UserAuthenticated) {
            Navigator.pushReplacementNamed(
                context, AllCompaniesScreen.routeName);
          }
          if (state is FailedToAuthenticateUser) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.errorMessage.toString()),
            ));
          }
        }, builder: (context, state) {
          if (state is AuthenticatingUser) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return PrimaryButton(
                onPressed: () {
                  context.read<AuthBloc>().add(AuthenticateUser(
                      userDetails: {"email": "a@gmail.com", "password": "13"}));
                },
                buttonTitle: StringConstants.kVerify);
          }
        }),
        InkWell(
          onTap: () {
            Navigator.pushReplacementNamed(context, RegisterScreen.routeName);
          },
          child: const Padding(
            padding: EdgeInsets.only(top: spacingStandard),
            child: Text('New user? Create an account!',
                style: TextStyle(color: AppColors.orange)),
          ),
        ),
      ],
    );
  }
}
