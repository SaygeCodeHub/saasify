import 'package:flutter/material.dart';
import 'package:saasify/screens/hrms/add_employee/widgets/add_employee_stepper.dart';
import 'package:saasify/screens/hrms/add_employee/widgets/employee_basic_details.dart';
import 'package:saasify/screens/hrms/add_employee/widgets/employee_document_details.dart';
import 'package:saasify/screens/hrms/add_employee/widgets/employee_fianancial_details.dart';
import 'package:saasify/screens/hrms/add_employee/widgets/employee_official_details.dart';

class AddEmployeeMobile extends StatelessWidget {
  final bool isViewOnly;
  final List<GlobalKey<FormState>> formKeys;
  const AddEmployeeMobile(
      {super.key, required this.formKeys, this.isViewOnly = false});

  @override
  Widget build(BuildContext context) {
    return AddEmployeeStepper(
        isViewOnly: isViewOnly,
        formKeys: formKeys,
        steps: [
          StepData(
              icon: Icons.info_outline,
              content: EmployeeBasicDetails(isViewOnly: isViewOnly)),
          StepData(
              icon: Icons.document_scanner_outlined,
              content: EmployeeDocumentDetails(isViewOnly: isViewOnly)),
          StepData(
              icon: Icons.monetization_on_outlined,
              content: EmployeeFinancialDetails(isViewOnly: isViewOnly)),
          StepData(
              icon: Icons.work_outline,
              content: EmployeeOfficialDetails(isViewOnly: isViewOnly)),
        ],
        isMobile: true);
  }
}
