import 'package:flutter/material.dart';
import 'package:saasify/screens/companies/widgets/branches/all_branches_mobile.dart';
import 'package:saasify/screens/companies/widgets/branches/all_branches_web.dart';
import '../../widgets/layoutWidgets/responsive_layout.dart';

class AllBranchesScreen extends StatelessWidget {
  static const routeName = 'AllBranchesScreen';
  final String companyName;
  final List<String> cardData = [
    "Branch 1",
    "Branch 2",
    "Branch 3",
    "Branch 4",
    "Branch 5",
    "Branch 6"
  ];

  AllBranchesScreen({super.key, required this.companyName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ResponsiveLayout(
      mobileBody:
          AllBranchesMobile(cardData: cardData, companyName: companyName),
      desktopBody: AllBranchesWeb(cardData: cardData, companyName: companyName),
    ));
  }
}
