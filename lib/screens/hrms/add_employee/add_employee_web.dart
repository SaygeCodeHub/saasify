import 'package:flutter/material.dart';
import 'package:saasify/screens/hrms/add_employee/widgets/employee_basic_details.dart';
import 'package:saasify/screens/hrms/add_employee/widgets/employee_document_details.dart';

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
        TabData(
            label: 'Education & Experience',
            content: const Center(child: Text('Education & Experience'))),
        TabData(
            label: 'Financial',
            content: const Center(child: Text('Financial'))),
        TabData(
            label: 'Official', content: const Center(child: Text('Official')))
      ],
    ));
  }
}
