import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinput/pinput.dart';
import 'package:saasify/bloc/authentication/authentication_bloc.dart';
import 'package:saasify/bloc/authentication/authentication_event.dart';
import 'package:saasify/bloc/authentication/authentication_states.dart';
import 'package:saasify/configs/app_color.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/utils/responsive.dart';
import '../../configs/app_dimensions.dart';
import '../../configs/app_spacing.dart';
import '../../utils/constants/string_constants.dart';
import '../../widgets/primary_button.dart';

class OtpScreen extends StatelessWidget {
  final String verificationId;
  final String userName;

  const OtpScreen(
      {super.key, required this.verificationId, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: spacingXXXHuge, right: spacingXXXHuge, top: spacingXXXHuge),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset("assets/SaaSify.svg", width: kLogoWidth),
            const SizedBox(height: spacingXXXHuge),
            Text(StringConstants.kEnterOtp,
                style: Theme.of(context).textTheme.xxTiny.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColor.saasifyDarkBlack)),
            const SizedBox(height: kGeneralButtonHeight),
            Text(StringConstants.kOtp,
                style: Theme.of(context).textTheme.xTiniest.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColor.saasifyLightBlack)),
            const SizedBox(height: spacingMedium),
            AspectRatio(
              aspectRatio: 360 / 55,
              child: Pinput(
                  defaultPinTheme: PinTheme(
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: AppColor.saasifyLighterGrey,
                          borderRadius: BorderRadius.circular(
                              context.responsive(8, desktop: 12)))),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onChanged: (value) {
                    context.read<AuthenticationBloc>().authDetails['otp'] =
                        value;
                  },
                  isCursorAnimationEnabled: false,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  length: 6),
            ),
            const SizedBox(height: spacingXXHuge),
            BlocBuilder<AuthenticationBloc, AuthenticationStates>(
              builder: (context, state) {
                if (state is OtpLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return PrimaryButton(
                  onPressed: () {
                    context.read<AuthenticationBloc>().add(VerifyOtp(
                        otpCode: context
                            .read<AuthenticationBloc>()
                            .authDetails['otp'],
                        verificationId: verificationId));
                  },
                  buttonWidth: double.maxFinite,
                  buttonTitle: StringConstants.kVerifyOtp,
                );
              },
            ),
            const SizedBox(height: spacingXXLarge),
          ]),
    );
  }
}
