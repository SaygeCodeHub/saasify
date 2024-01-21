import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import '../../../../utils/constants/string_constants.dart';
import '../../../../widgets/layoutWidgets/multifield_row.dart';
import '../../../../widgets/text/field_label_widget.dart';
import '../../../../widgets/text/module_heading.dart';

class EmployeeDocumentDetails extends StatelessWidget {
  const EmployeeDocumentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: spacingLarge, top: spacingXSmall),
            child: ModuleHeading(label: StringConstants.kAadhaar),
          ),
          MultiFieldRow(
            childrenWidgets: [
              LabelAndFieldWidget(label: StringConstants.kAadhaarNumber),
              LabelAndFieldWidget(label: StringConstants.kNameAsAadhaarNumber),
              LabelAndFieldWidget(label: StringConstants.kPanNumber)
            ],
          ),
          SizedBox(height: spacingHuge),
          Divider(),
          SizedBox(height: spacingHuge),
          Padding(
            padding: EdgeInsets.only(bottom: spacingLarge),
            child: ModuleHeading(label: StringConstants.kPassport),
          ),
          MultiFieldRow(
            childrenWidgets: [
              LabelAndFieldWidget(label: StringConstants.kPassportNumber),
              LabelAndFieldWidget(label: StringConstants.kFirstName),
              LabelAndFieldWidget(label: StringConstants.kLastName),
            ],
          ),
          SizedBox(height: spacingLarge),
          MultiFieldRow(
            childrenWidgets: [
              LabelAndFieldWidget(label: StringConstants.kExpiryDate),
              LabelAndFieldWidget(label: StringConstants.kIssueDate),
              LabelAndFieldWidget(label: StringConstants.kMobileNumber),
              LabelAndFieldWidget(label: StringConstants.kAddress)
            ],
          ),
          SizedBox(height: spacingLarge),
          MultiFieldRow(
            childrenWidgets: [
              LabelAndFieldWidget(label: StringConstants.kAddress, maxLines: 5)
            ],
          ),
        ],
      ),
    );
  }
}
