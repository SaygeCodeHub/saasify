import 'package:flutter/material.dart';
import 'package:saasify/screens/hrms/add_employee/widgets/add_employee_stepper.dart';
import 'package:saasify/screens/hrms/add_employee/widgets/employee_basic_details.dart';
import 'package:saasify/screens/hrms/add_employee/widgets/employee_document_details.dart';
import 'package:saasify/screens/hrms/add_employee/widgets/employee_fianancial_details.dart';
import 'package:saasify/screens/hrms/add_employee/widgets/employee_official_details.dart';

class AddEmployeeMobile extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const AddEmployeeMobile({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return AddEmployeeStepper(
        formKey: formKey,
        steps: [
          StepData(
              icon: Icons.info_outline, content: const EmployeeBasicDetails()),
          StepData(
              icon: Icons.document_scanner_outlined,
              content: const EmployeeDocumentDetails()),
          StepData(
              icon: Icons.monetization_on_outlined,
              content: const EmployeeFinancialDetails()),
          StepData(
              icon: Icons.work_outline,
              content: const EmployeeOfficialDetails()),
        ],
        isMobile: true);
  }
}
