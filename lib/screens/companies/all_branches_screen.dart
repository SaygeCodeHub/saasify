import 'package:flutter/material.dart';
import 'package:saasify/screens/companies/widgets/branches/all_branches_mobile.dart';
import 'package:saasify/screens/companies/widgets/branches/all_branches_web.dart';
import '../../data/models/authentication/authenticate_user_model.dart';
import '../../widgets/layoutWidgets/responsive_layout.dart';

class AllBranchesScreen extends StatelessWidget {
  static const routeName = 'AllBranchesScreen';
  final String companyName;
  final List<Branch> branches;

  const AllBranchesScreen(
      {super.key, required this.companyName, required this.branches});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ResponsiveLayout(
            mobileBody:
                AllBranchesMobile(branches: branches, companyName: companyName),
            desktopBody:
                AllBranchesWeb(branches: branches, companyName: companyName)));
  }
}
