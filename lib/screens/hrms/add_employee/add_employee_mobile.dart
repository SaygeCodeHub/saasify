import 'package:flutter/material.dart';
import 'package:saasify/screens/hrms/add_employee/widgets/employee_basic_details.dart';
import 'package:saasify/screens/hrms/add_employee/widgets/employee_document_details.dart';

import '../../../widgets/tab_bar/custom_tab_bar.dart';

class AddEmployeeMobile extends StatelessWidget {
  const AddEmployeeMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTabBar(tabData: [
      TabData(icon: Icons.info_outline, content: const EmployeeBasicDetails()),
      TabData(
          icon: Icons.document_scanner_outlined,
          content: const EmployeeDocumentDetails()),
      TabData(
          icon: Icons.school_outlined,
          content: const Center(child: Text('Education & Experience'))),
      TabData(
          icon: Icons.monetization_on_outlined,
          content: const Center(child: Text('Financial'))),
      TabData(
          icon: Icons.security, content: const Center(child: Text('Official')))
    ]);
  }
}
