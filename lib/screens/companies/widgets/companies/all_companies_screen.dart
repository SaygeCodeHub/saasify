import 'package:flutter/material.dart';
import 'package:saasify/data/models/authentication/authenticate_user_model.dart';
import 'package:saasify/screens/companies/widgets/companies/all_companies_mobile.dart';
import 'package:saasify/screens/companies/widgets/companies/all_companies_web.dart';
import 'package:saasify/widgets/layoutWidgets/responsive_layout.dart';

class AllCompaniesScreen extends StatelessWidget {
  final AuthenticateUserData authenticateUserData;
  static const routeName = 'AllCompaniesScreen';

  const AllCompaniesScreen({super.key, required this.authenticateUserData});

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Scaffold(
            body: ResponsiveLayout(
          mobileBody:
              AllCompaniesMobile(companies: authenticateUserData.company),
          desktopBody: AllCompaniesWeb(companies: authenticateUserData.company),
        )));
  }
}
