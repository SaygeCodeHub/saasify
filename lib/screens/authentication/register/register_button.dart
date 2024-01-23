import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/register/register_bloc.dart';
import 'package:saasify/bloc/register/register_events.dart';
import 'package:saasify/bloc/register/register_states.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/screens/authentication/auth/auhentication_screen.dart';
import 'package:saasify/screens/companies/widgets/addCompany/add_company_screen.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/alertDialogs/custom_alert_dialog.dart';
import 'package:saasify/widgets/buttons/primary_button.dart';

class RegisterButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const RegisterButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocConsumer<RegisterBloc, RegisterStates>(listener: (context, state) {
          if (state is UserRegistered) {
            Navigator.pushReplacementNamed(context, AddCompanyScreen.routeName);
          }
          if (state is FailedToRegisterUser) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return ErrorAlertDialog(
                    description: state.errorMessage.toString());
              },
            );
          }
        }, builder: (context, state) {
          if (state is RegisteringUser) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return PrimaryButton(
                onPressed: () {
                  if (formKey.currentState?.validate() ?? false) {
                    context.read<RegisterBloc>().add(RegisterUser(
                        userDetails: context
                            .read<RegisterBloc>()
                            .userInputAuthenticationMap));
                  }
                },
                buttonTitle: StringConstants.kRegister);
          }
        }),
        InkWell(
          onTap: () {
            Navigator.pushReplacementNamed(
                context, AuthenticationScreen.routeName);
          },
          child: const Padding(
            padding: EdgeInsets.only(top: spacingStandard),
            child: Text('Already have an account? Sign in!',
                style: TextStyle(color: AppColors.orange)),
          ),
        ),
      ],
    );
  }
}
