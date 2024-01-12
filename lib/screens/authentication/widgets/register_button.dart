import 'package:flutter/material.dart';
import '../../../configs/app_colors.dart';
import '../../../configs/app_spacing.dart';
import '../../../utils/constants/string_constants.dart';
import '../../../widgets/primary_button.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PrimaryButton(onPressed: () {}, buttonTitle: StringConstants.kRegister),
        const InkWell(
          child: Padding(
            padding: EdgeInsets.only(top: spacingStandard),
            child: Text('Already have an account? Sign in!',
                style: TextStyle(color: AppColors.orange)),
          ),
        ),
      ],
    );
  }
}
