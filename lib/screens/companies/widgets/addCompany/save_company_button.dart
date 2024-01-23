import 'package:flutter/material.dart';
import 'package:saasify/screens/hrms/hrms_dashboard_screen.dart';
import '../../../../utils/constants/string_constants.dart';
import '../../../../widgets/buttons/primary_button.dart';

class SaveCompanyButton extends StatelessWidget {
  const SaveCompanyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: PrimaryButton(
            onPressed: () {
              Navigator.pushNamed(context, HRMSDashboardScreen.routeName);
            },
            buttonTitle: StringConstants.kNext));
  }
}
