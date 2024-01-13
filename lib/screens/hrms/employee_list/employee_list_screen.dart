import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/screens/hrms/employee_list/employee_list_mobile.dart';
import 'package:saasify/screens/hrms/employee_list/employee_list_web.dart';
import 'package:saasify/widgets/responsive_layout.dart';

class EmployeeListScreen extends StatelessWidget {
  const EmployeeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Card(
        child: Padding(
          padding: EdgeInsets.all(spacingLarge),
          child: ResponsiveLayout(
            mobileBody: EmployeeListMobile(),
            desktopBody: EmployeeListWeb(),
          ),
        ),
      )
    );
  }
}
