import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import '../../../../utils/constants/string_constants.dart';
import '../../../../widgets/layoutWidgets/multifield_row.dart';
import '../../../../widgets/text/field_label_widget.dart';

class EmployeeBasicDetails extends StatelessWidget {
  const EmployeeBasicDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          MultiFieldRow(
            childrenWidgets: [
              LabelAndFieldWidget(label: StringConstants.kFirstName),
              LabelAndFieldWidget(label: StringConstants.kMiddleName),
              LabelAndFieldWidget(label: StringConstants.kLastName)
            ],
          ),
          SizedBox(height: spacingLarge),
          MultiFieldRow(
            childrenWidgets: [
              LabelAndFieldWidget(label: StringConstants.kEmailAddress),
              LabelAndFieldWidget(label: StringConstants.kMobileNumber),
              LabelAndFieldWidget(
                  label: StringConstants.kAlternateMobileNumber),
            ],
          ),
          SizedBox(height: spacingLarge),
          MultiFieldRow(
            childrenWidgets: [
              LabelAndFieldWidget(label: StringConstants.kDateOfBirth),
              LabelAndFieldWidget(label: StringConstants.kAge),
              LabelAndFieldWidget(label: StringConstants.kGender),
              LabelAndFieldWidget(label: StringConstants.kNationality),
              LabelAndFieldWidget(label: StringConstants.kMaritalStatus),
            ],
          ),
          SizedBox(height: spacingLarge),
          MultiFieldRow(
            childrenWidgets: [
              LabelAndFieldWidget(
                  label: StringConstants.kCurrentAddress, maxLines: 5),
              LabelAndFieldWidget(
                  label: StringConstants.kPermanentAddress, maxLines: 5),
            ],
          ),
          SizedBox(height: spacingLarge),
          MultiFieldRow(
            childrenWidgets: [
              LabelAndFieldWidget(label: StringConstants.kCity),
              LabelAndFieldWidget(label: StringConstants.kState),
              LabelAndFieldWidget(label: StringConstants.kPinCode),
            ],
          ),
        ],
      ),
    );
  }
}
