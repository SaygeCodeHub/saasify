import 'package:flutter/material.dart';
import 'package:saasify/screens/hrms/hrms_dashboard_screen.dart';
import '../../../../utils/constants/string_constants.dart';
import '../../../../widgets/buttons/primary_button.dart';

class SelectBranchButton extends StatelessWidget {
  const SelectBranchButton({super.key, required this.selectedBranchId});

  final int selectedBranchId;

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
        buttonTitle: StringConstants.kNext,
        onPressed: () {
          Navigator.pushNamed(context, HRMSDashboardScreen.routeName);
        });
  }
}
