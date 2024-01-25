import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/auth/auth_bloc.dart';
import 'package:saasify/bloc/auth/auth_events.dart';
import 'package:saasify/bloc/auth/auth_states.dart';
import 'package:saasify/caches/cache.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/screens/authentication/register/register_screen.dart';
import 'package:saasify/screens/companies/widgets/addCompany/add_company_screen.dart';
import 'package:saasify/screens/companies/widgets/branches/all_branches_screen.dart';
import 'package:saasify/screens/companies/widgets/companies/all_companies_screen.dart';
import 'package:saasify/screens/hrms/hrms_dashboard_screen.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/alertDialogs/error_alert_dialog.dart';
import 'package:saasify/widgets/buttons/primary_button.dart';

class AuthVerifyButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const AuthVerifyButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocConsumer<AuthBloc, AuthStates>(listener: (context, state) {
          if (state is UserAuthenticated) {
            if (state.authenticateUserData.company.isEmpty) {
              Navigator.pushReplacementNamed(
                  context, AddCompanyScreen.routeName);
            } else if (state.authenticateUserData.company.length > 1) {
              Navigator.pushReplacementNamed(
                  context, AllCompaniesScreen.routeName,
                  arguments: state.authenticateUserData);
            } else if (state
                    .authenticateUserData.company.first.branches.length >
                1) {
              getIt<Cache>().setCompanyId(state
                  .authenticateUserData.company.first.companyId
                  .toString());
              Navigator.pushReplacementNamed(
                  context, AllBranchesScreen.routeName,
                  arguments: [
                    state.authenticateUserData.company.first.companyName,
                    state.authenticateUserData.company.first.branches
                  ]);
            } else {
              getIt<Cache>().setCompanyId(state
                  .authenticateUserData.company.first.companyId
                  .toString());
              getIt<Cache>().setBranchId(state
                  .authenticateUserData.company.first.branches.first.branchId
                  .toString());
              Navigator.pushReplacementNamed(
                  context, HRMSDashboardScreen.routeName);
            }
          }
          if (state is FailedToAuthenticateUser) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return ErrorAlertDialog(
                    description: state.errorMessage.toString());
              },
            );
          }
        }, builder: (context, state) {
          if (state is AuthenticatingUser) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return PrimaryButton(
                onPressed: () {
                  if (formKey.currentState?.validate() ?? false) {
                    context.read<AuthBloc>().add(AuthenticateUser(
                        userDetails: context
                            .read<AuthBloc>()
                            .userInputAuthenticationMap));
                  }
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
