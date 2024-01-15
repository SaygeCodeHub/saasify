import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/screens/authentication/register_screen.dart';
import 'package:saasify/screens/hrms/hrms_dashboard_screen.dart';
import '../../../../bloc/authentication/authentication_bloc.dart';
import '../../../../bloc/authentication/authentication_states.dart';
import '../../../../configs/app_spacing.dart';
import '../../../../utils/constants/string_constants.dart';
import '../../../../widgets/buttons/primary_button.dart';

class AuthVerifyButton extends StatelessWidget {
  const AuthVerifyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationStates>(
      builder: (context, state) {
        if (state is TextFieldChanged) {
          return Column(
            children: [
              PrimaryButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, HRMSDashboardScreen.routeName);
                    // context.read<AuthenticationBloc>().add(SignIn());
                  },
                  buttonTitle: StringConstants.kVerify),
              const InkWell(
                child: Padding(
                  padding: EdgeInsets.only(top: spacingStandard),
                  child: Text('New user? Create an account!'),
                ),
              ),
            ],
          );
        } else if (state is AuthenticationLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Column(
            children: [
              PrimaryButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, HRMSDashboardScreen.routeName);
                  },
                  buttonTitle: StringConstants.kVerify),
              InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(
                      context, RegisterScreen.routeName);
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
      },
    );
  }
}
