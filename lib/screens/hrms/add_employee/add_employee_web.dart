import 'package:flutter/material.dart';
import 'package:saasify/screens/hrms/add_employee/widgets/add_employee_stepper.dart';
import 'package:saasify/screens/hrms/add_employee/widgets/employee_basic_details.dart';
import 'package:saasify/screens/hrms/add_employee/widgets/employee_document_details.dart';
import 'package:saasify/screens/hrms/add_employee/widgets/employee_fianancial_details.dart';
import 'package:saasify/screens/hrms/add_employee/widgets/employee_official_details.dart';
import 'package:saasify/widgets/layoutWidgets/background_card_widget.dart';

class AddEmployeeWeb extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const AddEmployeeWeb({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BackgroundCardWidget(
        childScreen: AddEmployeeStepper(
            formKey: formKey,
            steps: [
              StepData(
                  label: "Personal Details",
                  content: const EmployeeBasicDetails()),
              StepData(
                  label: "Document Details",
                  content: const EmployeeDocumentDetails()),
              StepData(
                  label: "Financial Details",
                  content: const EmployeeFinancialDetails()),
              StepData(
                  label: "Official Details",
                  content: const EmployeeOfficialDetails()),
            ],
            isMobile: false));
  }
}
