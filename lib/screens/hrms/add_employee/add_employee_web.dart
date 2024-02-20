import 'package:flutter/material.dart';
import 'package:saasify/screens/hrms/add_employee/widgets/add_employee_stepper.dart';
import 'package:saasify/screens/hrms/add_employee/widgets/employee_basic_details.dart';
import 'package:saasify/screens/hrms/add_employee/widgets/employee_document_details.dart';
import 'package:saasify/screens/hrms/add_employee/widgets/employee_fianancial_details.dart';
import 'package:saasify/screens/hrms/add_employee/widgets/employee_official_details.dart';
import 'package:saasify/widgets/layoutWidgets/background_card_widget.dart';

class AddEmployeeWeb extends StatelessWidget {
  final bool isViewOnly;
  final List<GlobalKey<FormState>> formKeys;
  const AddEmployeeWeb(
      {super.key, required this.formKeys, this.isViewOnly = false});

  @override
  Widget build(BuildContext context) {
    return BackgroundCardWidget(
        childScreen: AddEmployeeStepper(
            formKeys: formKeys,
            isViewOnly: isViewOnly,
            steps: [
              StepData(
                  label: "Personal Details",
                  content: EmployeeBasicDetails(isViewOnly: isViewOnly)),
              StepData(
                  label: "Document Details",
                  content: EmployeeDocumentDetails(isViewOnly: isViewOnly)),
              StepData(
                  label: "Financial Details",
                  content: EmployeeFinancialDetails(isViewOnly: isViewOnly)),
              StepData(
                  label: "Official Details",
                  content: EmployeeOfficialDetails(isViewOnly: isViewOnly)),
            ],
            isMobile: false));
  }
}
