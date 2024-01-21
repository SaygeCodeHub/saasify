import 'package:flutter/material.dart';
import 'package:saasify/caches/cache.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/screens/hrms/hrms_dashboard_screen.dart';
import '../../../../utils/constants/string_constants.dart';
import '../../../../widgets/buttons/primary_button.dart';

class SelectBranchButton extends StatelessWidget {
  const SelectBranchButton(
      {super.key, required this.selectedBranchId, required this.roles});

  final List<int> roles;
  final String selectedBranchId;

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
        buttonTitle: StringConstants.kNext,
        onPressed: () {
          saveUserSelections();
          Future.delayed(const Duration(seconds: 1));
          Navigator.pushNamed(context, HRMSDashboardScreen.routeName);
        });
  }

  saveUserSelections() {
    List<int> intList = roles;
    List<String> stringList =
        intList.map((int number) => number.toString()).toList();
    getIt<Cache>().setBranchId(selectedBranchId);
    getIt<Cache>().setRole(stringList);
  }
}
