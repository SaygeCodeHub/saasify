import 'package:flutter/material.dart';
import 'package:saasify/screens/companies/widgets/companies/all_companies_mobile.dart';
import 'package:saasify/screens/companies/widgets/companies/all_companies_web.dart';
import 'package:saasify/widgets/layoutWidgets/responsive_layout.dart';

class AllCompaniesScreen extends StatelessWidget {
  static const routeName = 'AllCompaniesScreen';
  final List<String> cardData = [
    "Company 1",
    "Company 2",
    "Company 3",
    "Company 4",
    "Company 5",
    "Company 6"
  ];

  AllCompaniesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Scaffold(
            body: ResponsiveLayout(
          mobileBody: AllCompaniesMobile(cardData: cardData),
          desktopBody: AllCompaniesWeb(cardData: cardData),
        )));
  }
}
