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
              Expanded(
                  child: LabelAndFieldWidget(
                      label: StringConstants.kAadhaarNumber)),
              SizedBox(width: spacingLarge),
              Expanded(
                  child: LabelAndFieldWidget(
                      label: StringConstants.kNameAsAadhaarNumber)),
              SizedBox(width: spacingLarge),
              Expanded(
                  child: LabelAndFieldWidget(label: StringConstants.kPanNumber))
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
              Expanded(
                  child: LabelAndFieldWidget(
                      label: StringConstants.kPassportNumber)),
              SizedBox(width: spacingLarge),
              Expanded(
                  child:
                      LabelAndFieldWidget(label: StringConstants.kFirstName)),
              SizedBox(width: spacingLarge),
              Expanded(
                  child: LabelAndFieldWidget(label: StringConstants.kLastName)),
            ],
          ),
          SizedBox(height: spacingLarge),
          MultiFieldRow(
            childrenWidgets: [
              Expanded(
                  child:
                      LabelAndFieldWidget(label: StringConstants.kExpiryDate)),
              SizedBox(width: spacingLarge),
              Expanded(
                  child:
                      LabelAndFieldWidget(label: StringConstants.kIssueDate)),
              SizedBox(width: spacingLarge),
              Expanded(
                  child: LabelAndFieldWidget(
                      label: StringConstants.kMobileNumber)),
              SizedBox(width: spacingLarge),
              Expanded(
                  child: LabelAndFieldWidget(label: StringConstants.kAddress))
            ],
          ),
          SizedBox(height: spacingLarge),
          MultiFieldRow(
            childrenWidgets: [
              Expanded(
                  child: LabelAndFieldWidget(
                      label: StringConstants.kAddress, maxLines: 5))
            ],
          ),
        ],
      ),
    );
  }
}
