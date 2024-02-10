import 'package:flutter/material.dart';
import 'package:saasify/screens/hrms/add_employee/widgets/employee_basic_details.dart';
import 'package:saasify/screens/hrms/add_employee/widgets/employee_document_details.dart';
import 'package:saasify/screens/hrms/add_employee/widgets/employee_fianancial_details.dart';
import 'package:saasify/screens/hrms/add_employee/widgets/employee_official_details.dart';

import '../../../widgets/layoutWidgets/background_card_widget.dart';
import '../../../widgets/tab_bar/custom_tab_bar.dart';

class AddEmployeeWeb extends StatelessWidget {
  const AddEmployeeWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundCardWidget(
        childScreen: CustomTabBar(
      tabData: [
        TabData(label: 'Personal Info', content: const EmployeeBasicDetails()),
        TabData(label: 'Documents', content: const EmployeeDocumentDetails()),
        TabData(label: 'Financial', content: const EmployeeFinancialDetails()),
        TabData(label: 'Official', content: const EmployeeOfficialDetails())
      ],
    ));
  }
}
