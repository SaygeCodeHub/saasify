import 'package:flutter/material.dart';
import '../../../widgets/buttons/primary_button.dart';

class CommonButton extends StatelessWidget {
  final String buttonTitle;
  final Function onPressed;

  const CommonButton(
      {super.key, required this.buttonTitle, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: PrimaryButton(
            onPressed: () {
              onPressed();
            },
            buttonTitle: buttonTitle));
  }
}
