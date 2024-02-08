import 'package:flutter/material.dart';
import 'package:saasify/caches/cache.dart';
import 'package:saasify/data/models/authentication/authenticate_user_model.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/screens/hrms/hrms_dashboard_screen.dart';
import '../../../../utils/constants/string_constants.dart';
import '../../../../widgets/buttons/primary_button.dart';

class SelectBranchButton extends StatelessWidget {
  const SelectBranchButton({super.key, required this.branch});

  final Branch branch;

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
        buttonTitle: StringConstants.kNext,
        onPressed: () {
          Future.delayed(const Duration(seconds: 1));
          Navigator.pushNamed(context, HRMSDashboardScreen.routeName);
        });
  }

  saveUserSelection() {
    getIt<Cache>().setBranchId(branch.branchId);
    getIt<Cache>().setBranchName(branch.branchName);
    getIt<Cache>().setDesignations(branch.designations);
    getIt<Cache>().setAccessibleFeatures(branch.accessibleFeatures);
    getIt<Cache>().setAccessibleModules(branch.accessibleModules);
  }
}
