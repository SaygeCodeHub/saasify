import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/authentication/authentication_bloc.dart';
import 'package:saasify/bloc/authentication/authentication_states.dart';
import 'package:saasify/screens/authentication/widgets/auth_mobile_screen.dart';
import 'package:saasify/screens/authentication/widgets/auth_web_screen.dart';
import 'package:saasify/screens/skeleton_screen.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/alert_dialogue_box.dart';
import '../../widgets/responsive_layout.dart';

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
                      Navigator.pushNamed(context, routeName);
                    } else if (state.authenticationModel.data.companies.first
                            .branches.length >
                        1) {
                      Navigator.pushNamed(context, routeName,
                          arguments: state.authenticationModel.data.companies
                              .first.branches.first);
                    } else {
                      Navigator.pushNamed(context, SkeletonScreen.routeName);
                    }
                  } else if (state is AuthenticationSuccessNoBackend) {
                    Navigator.pushReplacementNamed(
                        context, SkeletonScreen.routeName);
                  }
                },
                child: const ResponsiveLayout(
                    mobileBody: AuthMobileScreen(),
                    desktopBody: AuthWebScreen()))));
  }
}
