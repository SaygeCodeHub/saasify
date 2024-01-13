import 'package:flutter/material.dart';
import '../../../utils/constants/string_constants.dart';
import '../../../widgets/primary_button.dart';

class SaveCompanyButton extends StatelessWidget {
  const SaveCompanyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: PrimaryButton(
            onPressed: () {}, buttonTitle: StringConstants.kNext));
  }
}
