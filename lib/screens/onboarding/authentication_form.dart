import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saasify/bloc/authentication/authentication_bloc.dart';
import 'package:saasify/bloc/authentication/authentication_event.dart';
import 'package:saasify/bloc/authentication/authentication_states.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import '../../configs/app_color.dart';
import '../../configs/app_dimensions.dart';
import '../../utils/constants/string_constants.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/primary_button.dart';

class AuthenticationBody extends StatelessWidget {
  final String focusField;
  final bool isLogin;

  AuthenticationBody({
    super.key,
    required this.isLogin,
    required this.focusField,
  });

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
            padding: const EdgeInsets.only(
                left: spacingXXXHuge,
                right: spacingXXXHuge,
                top: spacingXXXHuge),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset("assets/SaaSify.svg", width: kLogoWidth),
                  const SizedBox(height: spacingXXXHuge),
                  (isLogin)
                      ? Text(StringConstants.kWelcome,
                          style: Theme.of(context).textTheme.xxTiny.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColor.saasifyDarkBlack))
                      : Text(StringConstants.kHello,
                          style: Theme.of(context)
                              .textTheme
                              .xxTiny
                              .copyWith(fontWeight: FontWeight.w700)),
                  const SizedBox(height: kHelloSpacingHeight),
                  Visibility(
                      visible: !isLogin,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(StringConstants.kName,
                                style: Theme.of(context)
                                    .textTheme
                                    .tiniest
                                    .copyWith(fontWeight: FontWeight.w700)),
                            const SizedBox(height: spacingMedium),
                            CustomTextField(
                                autofocus: focusField == 'user_name',
                                initialValue: context
                                    .read<AuthenticationBloc>()
                                    .authDetails['user_name'],
                                hintText: StringConstants.kWhatsYourName,
                                keyboardType: TextInputType.text,
                                onTextFieldChanged: (value) {
                                  context.read<AuthenticationBloc>().add(
                                      TextFieldChange(
                                          isLogin: isLogin,
                                          focusField: 'user_name'));
                                  context
                                      .read<AuthenticationBloc>()
                                      .authDetails['user_name'] = value;
                                }),
                            const SizedBox(height: spacingXXHuge),
                          ])),
                  Text(StringConstants.kContactNumber,
                      style: Theme.of(context).textTheme.xTiniest.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColor.saasifyLightBlack)),
                  const SizedBox(height: spacingXMedium),
                  CustomTextField(
                      autofocus: focusField == 'user_contact',
                      initialValue: context
                          .read<AuthenticationBloc>()
                          .authDetails['user_contact'],
                      hintText: StringConstants.kAddYourContactNumber,
                      validator: (value) {
                        if (!RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)')
                            .hasMatch(value!)) {
                          return StringConstants.kPleaseAddAValidContact;
                        }
                        return null;
                      },
                      maxLength: 10,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      onTextFieldChanged: (value) {
                        context.read<AuthenticationBloc>().add(TextFieldChange(
                            isLogin: isLogin, focusField: 'user_contact'));
                        context
                            .read<AuthenticationBloc>()
                            .authDetails['user_contact'] = value;
                      }),
                  const SizedBox(height: spacingXXHuge),
                  BlocBuilder<AuthenticationBloc, AuthenticationStates>(
                      builder: (context, state) {
                    if (state is OtpLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return PrimaryButton(
                        onPressed: (context
                                .read<AuthenticationBloc>()
                                .loginButtonEnabled)
                            ? () {
                                if (_formKey.currentState!.validate()) {
                                  context
                                      .read<AuthenticationBloc>()
                                      .add(GetOtp());
                                }
                              }
                            : null,
                        buttonWidth: double.maxFinite,
                        buttonTitle: (isLogin) ? 'Login' : 'SignUp',
                      );
                    }
                  })
                ])));
  }
}
