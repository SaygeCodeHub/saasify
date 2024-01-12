import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/authentication/authentication_bloc.dart';
import 'package:saasify/bloc/authentication/authentication_states.dart';
import 'package:saasify/screens/authentication/widgets/auth_mobile_screen.dart';
import 'package:saasify/screens/authentication/widgets/auth_web_screen.dart';
import 'package:saasify/screens/dashboard/dashboard_screen.dart';
import 'package:saasify/screens/modules/module_screen.dart';
import 'package:saasify/screens/onboarding/list_of_branches_screen.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/alert_dialogue_box.dart';
import '../../widgets/responsive_layout.dart';
import '../onboarding/list_of_companies_screen.dart';

class AuthenticationScreen extends StatelessWidget {
  static const routeName = 'AuthenticationScreen';

  AuthenticationScreen({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Scaffold(
            body: BlocListener<AuthenticationBloc, AuthenticationStates>(
                listener: (context, state) {
                  if (state is AuthenticationError) {
                    showErrorDialogue(context,
                        message: state.error,
                        primaryButtonTitle: StringConstants.kOk,
                        primaryOnPressed: () {
                      Navigator.pushReplacementNamed(
                          context, AuthenticationScreen.routeName);
                    });
                  } else if (state is AuthenticationSuccess) {
                    if (state.authenticationModel.data.companies.length > 1) {
                      Navigator.pushNamed(context, CompanyListScreen.routeName);
                    } else if (state.authenticationModel.data.companies.first
                            .branches.length >
                        1) {
                      Navigator.pushNamed(context, BranchesListScreen.routeName,
                          arguments: state.authenticationModel.data.companies
                              .first.branches.first);
                    } else {
                      Navigator.pushNamed(context, DashboardsScreen.routeName);
                    }
                  } else if (state is AuthenticationSuccessNoBackend) {
                    Navigator.pushReplacementNamed(
                        context, ModulesScreen.routeName);
                  }
                },
                child: const ResponsiveLayout(
                    mobileBody: AuthMobileScreen(),
                    desktopBody: AuthWebScreen()))));
  }
}
