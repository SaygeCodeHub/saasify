import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/screens/hrms/leaves/widgets/date_picker_textfield.dart';
import 'package:saasify/widgets/text/textfield_label_widget.dart';

class AssignTaskMobileScreen extends StatefulWidget {
  const AssignTaskMobileScreen({super.key});

  @override
  State<AssignTaskMobileScreen> createState() => _AssignTaskMobileScreenState();
}

class _AssignTaskMobileScreenState extends State<AssignTaskMobileScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Form(
      child: Column(children: [
        const SizedBox(height: spacingXMedium),
        TextfieldLabelWidget(
            label: 'Title', maxLines: 1, onTextFieldChanged: (text) {}),
        const SizedBox(height: spacingXMedium),
        TextfieldLabelWidget(
            label: 'Description', maxLines: 7, onTextFieldChanged: (text) {}),
        const SizedBox(height: spacingXMedium),
        TextfieldLabelWidget(
            label: 'Assign To ', maxLines: 1, onTextFieldChanged: (text) {}),
        const SizedBox(height: spacingXMedium),
        const SizedBox(height: spacingXMedium),
        TextfieldLabelWidget(
            label: 'Monitored By ', maxLines: 1, onTextFieldChanged: (text) {}),
        const SizedBox(height: spacingXMedium),
        const DateDisplayWidget(label: 'Due Date', isStartDate: true),
        const SizedBox(height: spacingXMedium),
      ]),
    ));
  }
}
