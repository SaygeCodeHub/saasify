import 'package:flutter/material.dart';
import 'package:saasify/widgets/buttons/primary_button.dart';

class EditSettingsButton extends StatelessWidget {
  final String buttonTitle;
  final Function onPressed;

  const EditSettingsButton(
      {super.key, required this.buttonTitle, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      onPressed: () {
        onPressed();
      },
      buttonTitle: buttonTitle,
      buttonWidth: MediaQuery.sizeOf(context).width * 0.10,
    );
  }
}
