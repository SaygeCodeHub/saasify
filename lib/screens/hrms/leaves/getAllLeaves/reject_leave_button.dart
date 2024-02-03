import 'package:flutter/material.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/buttons/primary_button.dart';
class RejectLeaveButton extends StatelessWidget {
  final Function? onPressed;
  const RejectLeaveButton({
    super.key, this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
        buttonWidth: 100,
        buttonTitle: StringConstants.kReject,
        onPressed: () {if (onPressed != null) {
          onPressed!();
        } else {
          Navigator.pop(context);
        }});
  }
}