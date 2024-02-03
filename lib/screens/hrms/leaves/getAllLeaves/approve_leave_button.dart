import 'package:flutter/material.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/buttons/primary_button.dart';

class ApproveLeaveButton extends StatelessWidget {
  final Function? onPressed;
  const ApproveLeaveButton({
    super.key, this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
        buttonWidth: 100,
        buttonTitle: StringConstants.kApprove,
        onPressed: () {if (onPressed != null) {
          onPressed!();
        } else {
          Navigator.pop(context);
        }});
  }
}
