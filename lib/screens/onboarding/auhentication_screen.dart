import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/authentication/authentication_bloc.dart';
import 'package:saasify/bloc/authentication/authentication_event.dart';
import 'package:saasify/bloc/authentication/authentication_states.dart';
import 'package:saasify/screens/dashboard/dashboard_screen.dart';
import 'package:saasify/screens/onboarding/authentication_form.dart';
import 'package:saasify/screens/onboarding/list_of_branches_screen.dart';
import 'package:saasify/screens/onboarding/list_of_companies_screen.dart';
import 'package:saasify/screens/onboarding/otp_screen.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/alert_dialogue_box.dart';
import '../../configs/app_color.dart';

class AuthenticationScreen extends StatelessWidget {
  static const routeName = 'SignUpScreen';

  AuthenticationScreen({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    context
        .read<AuthenticationBloc>()
        .add(SwitchAuthentication(isLogin: false, focusField: ''));
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            backgroundColor: AppColor.saasifyWhite,
            body: Row(children: [
              Expanded(
                  flex: 4,
                  child: BlocConsumer<AuthenticationBloc, AuthenticationStates>(
                      listener: (context, state) {
                    if (state is PhoneOtpVerified) {
                      if (state.userData.companies.length > 1) {
                        Navigator.pushReplacementNamed(
                            context, CompanyListScreen.routeName,
                            arguments: state.userData.companies);
                      } else {
                        if (state.userData.companies.first.branches.length >
                            1) {
                          Navigator.pushReplacementNamed(
                              context, BranchesListScreen.routeName,
                              arguments: state.userData.companies.first);
                        } else {
                          Navigator.pushReplacementNamed(
                              context, DashboardsScreen.routeName);
                        }
                      }
                    }
                    if (state is PhoneAuthError) {
                      showDialog(
                          context: context,
                          builder: (ctx) => AlertDialogueBox(
                              title: StringConstants.kSomethingWentWrong,
                              message: state.error,
                              primaryButtonTitle: StringConstants.kOk,
                              checkMarkVisible: false,
                              primaryOnPressed: () {
                                Navigator.pop(ctx);
                                context
                                    .read<AuthenticationBloc>()
                                    .authDetails
                                    .clear();
                                context.read<AuthenticationBloc>().add(
                                    SwitchAuthentication(
                                        isLogin: false, focusField: ''));
                                Navigator.pushReplacementNamed(
                                    context, AuthenticationScreen.routeName);
                              }));
                    }
                  }, buildWhen: (prev, curr) {
                    return curr is AuthenticationFormLoaded ||
                        curr is OtpReceived;
                  }, builder: (context, state) {
                    if (state is AuthenticationFormLoaded) {
                      return AuthenticationBody(
                          isLogin: state.isLogin, focusField: state.focusField);
                    } else if (state is OtpReceived) {
                      return OtpScreen(
                          verificationId: state.verificationId,
                          userName: state.userName);
                    }
                    return const SizedBox();
                  })),
              Expanded(
                  flex: 6,
                  child: Container(color: AppColor.saasifyLightDeepBlue))
            ])));
  }
}
