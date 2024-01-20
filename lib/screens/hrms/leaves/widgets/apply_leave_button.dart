import 'package:flutter/material.dart';

import '../../../../widgets/buttons/primary_button.dart';

class ApplyLeaveButton extends StatelessWidget {
  const ApplyLeaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
        buttonTitle: 'Apply',
        onPressed: () {},
        buttonWidth: MediaQuery.sizeOf(context).width * 0.15);
  }
}
