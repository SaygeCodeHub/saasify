import 'package:flutter/material.dart';
import 'package:saasify/screens/companies/widgets/addCompany/add_company_mobile_screen.dart';
import 'package:saasify/screens/companies/widgets/addCompany/add_company_web_screen.dart';
import 'package:saasify/widgets/layoutWidgets/responsive_layout.dart';

class AddCompanyScreen extends StatelessWidget {
  static const routeName = 'AddCompanyScreen';
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AddCompanyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Form(
          key: formKey,
          child: ResponsiveLayout(
              mobileBody: AddCompanyMobileScreen(formKey: formKey),
              desktopBody: AddCompanyWebScreen(formKey: formKey)),
        ),
      ),
    );
  }
}
