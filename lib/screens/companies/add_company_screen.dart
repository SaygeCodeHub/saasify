import 'package:flutter/material.dart';
import 'package:saasify/screens/companies/widgets/add_company_mobile_screen.dart';
import 'package:saasify/screens/companies/widgets/add_company_web_screen.dart';
import 'package:saasify/widgets/responsive_layout.dart';

class AddCompanyScreen extends StatelessWidget {
  const AddCompanyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PopScope(
      canPop: false,
      child: Scaffold(
        body: ResponsiveLayout(
            mobileBody: AddCompanyMobileScreen(),
            desktopBody: AddCompanyWebScreen()),
      ),
    );
  }
}
