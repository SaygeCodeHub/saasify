import 'package:flutter/material.dart';
import 'package:saasify/screens/hrms/add_employee/add_employee_web.dart';

import '../../../configs/app_spacing.dart';
import '../../../widgets/responsive_layout.dart';
import '../../../widgets/text/module_heading.dart';
import 'add_employee_mobile.dart';

class AddEmployeeScreen extends StatelessWidget {
  static const routeName = 'AddEmployeeScreen';

  const AddEmployeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: spacingMedium),
        Padding(
          padding: EdgeInsets.only(left: spacingLarge, top: spacingXXSmall),
          child: ModuleHeading(label: 'Add New Employee'),
        ),
        Expanded(
          child: ResponsiveLayout(
              mobileBody: AddEmployeeMobile(), desktopBody: AddEmployeeWeb()),
        ),
      ],
    );
  }
}
