import 'package:flutter/material.dart';
import 'package:saasify/caches/cache.dart';
import 'package:saasify/data/models/authentication/authenticate_user_model.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/screens/hrms/hrms_dashboard_screen.dart';
import '../../../../utils/constants/string_constants.dart';
import '../../../../widgets/buttons/primary_button.dart';
import '../branches/all_branches_screen.dart';

class SelectCompanyButton extends StatelessWidget {
  const SelectCompanyButton(
      {super.key, required this.companyName, required this.branches});

  final List<Branch> branches;
  final String companyName;

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
        buttonTitle: StringConstants.kNext,
        onPressed: () {
          getIt<Cache>().setCompanyId(companyName);
          if (branches.length <= 1) {
            getIt<Cache>().setBranchId(branches[0].branchId.toString());
            Future.delayed(const Duration(seconds: 1));
            Navigator.pushNamed(context, HRMSDashboardScreen.routeName);
          } else {
            Navigator.pushNamed(context, AllBranchesScreen.routeName,
                arguments: [companyName, branches]);
          }
        });
  }
}
