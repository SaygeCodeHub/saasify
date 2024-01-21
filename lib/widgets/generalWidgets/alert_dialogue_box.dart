import 'package:flutter/material.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/buttons/primary_button.dart';
import 'package:saasify/widgets/buttons/secondary_button.dart';
import '../../configs/app_colors.dart';
import '../../configs/app_dimensions.dart';
import '../../configs/app_spacing.dart';

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
                                  color: AppColors.successGreen)),
                          Visibility(
                              visible: errorMarkVisible,
                              child: const Icon(Icons.warning,
                                  color: AppColors.errorRed)),
                          Visibility(
                              visible: checkMarkVisible,
                              child: const SizedBox(width: spacingXSmall)),
                          Text(title,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
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
                  Text(message, style: Theme.of(context).textTheme.labelLarge),
                  const SizedBox(height: spacingXLarge),
                  Row(children: [
                    const Spacer(flex: 2),
                    Expanded(
                        child: (secondaryButtonTitle == null)
                            ? const SizedBox.shrink()
                            : SecondaryButton(
                                side: const BorderSide(
                                    color: AppColors.lightGrey),
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

showErrorDialogue(BuildContext context,
    {required String message,
    required String primaryButtonTitle,
    required void Function() primaryOnPressed}) {
  showDialog(
      context: context,
      builder: (context) => AlertDialogueBox(
          title: StringConstants.kSomethingWentWrong,
          message: message,
          primaryButtonTitle: primaryButtonTitle,
          errorMarkVisible: true,
          primaryOnPressed: () {
            Navigator.pop(context);
            primaryOnPressed();
          }));
}

showSuccessDialogue(BuildContext context,
    {required String message,
    required String primaryButtonTitle,
    required void Function() primaryOnPressed}) {
  showDialog(
      context: context,
      builder: (context) => AlertDialogueBox(
          title: StringConstants.kSuccess,
          message: message,
          primaryButtonTitle: primaryButtonTitle,
          checkMarkVisible: true,
          primaryOnPressed: () {
            Navigator.pop(context);
            primaryOnPressed();
          }));
}

showWarningDialogue(BuildContext context,
    {required String message,
    required String primaryButtonTitle,
    String? secondaryButtonTitle,
    required void Function() primaryOnPressed,
    void Function()? secondaryOnPressed}) {
  showDialog(
      context: context,
      builder: (context) => AlertDialogueBox(
          title: StringConstants.kWarning,
          message: message,
          primaryButtonTitle: primaryButtonTitle,
          secondaryButtonTitle: secondaryButtonTitle,
          secondaryOnPressed: secondaryOnPressed,
          checkMarkVisible: true,
          primaryOnPressed: () {
            Navigator.pop(context);
            primaryOnPressed();
          }));
}
