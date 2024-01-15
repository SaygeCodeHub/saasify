import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/widgets/primary_button.dart';
import 'package:saasify/widgets/secondary_button.dart';
import '../configs/app_color.dart';
import '../configs/app_dimensions.dart';
import '../configs/app_spacing.dart';

class AlertDialogueBox extends StatelessWidget {
  const AlertDialogueBox(
      {super.key,
      required this.title,
      required this.message,
      required this.primaryButtonTitle,
      this.checkMarkVisible = false,
      this.errorMarkVisible = false,
      this.secondaryOnPressed,
      this.secondaryButtonTitle,
      required this.primaryOnPressed});

  final String title;
  final String message;
  final String primaryButtonTitle;
  final String? secondaryButtonTitle;
  final void Function()? secondaryOnPressed;
  final void Function()? primaryOnPressed;
  final bool checkMarkVisible;
  final bool errorMarkVisible;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: SizedBox(
            width: kAlertBoxWidth,
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Visibility(
                              visible: checkMarkVisible,
                              child: const Icon(Icons.check_circle_rounded,
                                  color: AppColor.saasifyGreen)),
                          Visibility(
                              visible: errorMarkVisible,
                              child: const Icon(Icons.warning,
                                  color: AppColor.saasifyRed)),
                          Visibility(
                              visible: checkMarkVisible,
                              child: const SizedBox(width: spacingXXSmall)),
                          Text(title,
                              style: Theme.of(context)
                                  .textTheme
                                  .tiniest
                                  .copyWith(fontWeight: FontWeight.w700))
                        ]),
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Image.asset('assets/close.png',
                                height: kCloseIconSize, width: kCloseIconSize))
                      ]),
                  const SizedBox(height: spacingXLarge),
                  Text(message, style: Theme.of(context).textTheme.xxTiniest),
                  const SizedBox(height: spacingXLarge),
                  Row(children: [
                    const Spacer(flex: 2),
                    Expanded(
                        child: (secondaryButtonTitle == null)
                            ? const SizedBox.shrink()
                            : SecondaryButton(
                                side: const BorderSide(
                                    color: AppColor.saasifyLightWhite),
                                onPressed: secondaryOnPressed,
                                buttonTitle: secondaryButtonTitle ?? '')),
                    const SizedBox(width: spacingStandard),
                    Expanded(
                        child: PrimaryButton(
                            onPressed: primaryOnPressed,
                            buttonWidth: spacingXXXHuge,
                            buttonTitle: primaryButtonTitle))
                  ])
                ])));
  }
}
