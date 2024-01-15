import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import '../../../../utils/constants/string_constants.dart';
import '../../../../widgets/multifield_row.dart';
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
              Expanded(
                  child:
                      LabelAndFieldWidget(label: StringConstants.kFirstName)),
              SizedBox(width: spacingLarge),
              Expanded(
                  child:
                      LabelAndFieldWidget(label: StringConstants.kMiddleName)),
              SizedBox(width: spacingLarge),
              Expanded(
                  child: LabelAndFieldWidget(label: StringConstants.kLastName))
            ],
          ),
          SizedBox(height: spacingLarge),
          MultiFieldRow(
            childrenWidgets: [
              Expanded(
                  child: LabelAndFieldWidget(
                      label: StringConstants.kEmailAddress)),
              SizedBox(width: spacingLarge),
              Expanded(
                  child: LabelAndFieldWidget(
                      label: StringConstants.kMobileNumber)),
              SizedBox(width: spacingLarge),
              Expanded(
                  child: LabelAndFieldWidget(
                      label: StringConstants.kAlternateMobileNumber)),
            ],
          ),
          SizedBox(height: spacingLarge),
          MultiFieldRow(
            childrenWidgets: [
              Expanded(
                  child:
                      LabelAndFieldWidget(label: StringConstants.kDateOfBirth)),
              SizedBox(width: spacingLarge),
              Expanded(child: LabelAndFieldWidget(label: StringConstants.kAge)),
              SizedBox(width: spacingLarge),
              Expanded(
                  child: LabelAndFieldWidget(label: StringConstants.kGender)),
              SizedBox(width: spacingLarge),
              Expanded(
                  child:
                      LabelAndFieldWidget(label: StringConstants.kNationality)),
              SizedBox(width: spacingLarge),
              Expanded(
                  child: LabelAndFieldWidget(
                      label: StringConstants.kMaritalStatus)),
            ],
          ),
          SizedBox(height: spacingLarge),
          MultiFieldRow(
            childrenWidgets: [
              Expanded(
                  child: LabelAndFieldWidget(
                      label: StringConstants.kCurrentAddress, maxLines: 5)),
              SizedBox(width: spacingLarge),
              Expanded(
                  child: LabelAndFieldWidget(
                      label: StringConstants.kPermanentAddress, maxLines: 5)),
            ],
          ),
          SizedBox(height: spacingLarge),
          MultiFieldRow(
            childrenWidgets: [
              Expanded(
                  child: LabelAndFieldWidget(label: StringConstants.kCity)),
              SizedBox(width: spacingLarge),
              Expanded(
                  child: LabelAndFieldWidget(label: StringConstants.kState)),
              SizedBox(width: spacingLarge),
              Expanded(
                  child: LabelAndFieldWidget(label: StringConstants.kPinCode)),
            ],
          ),
        ],
      ),
    );
  }
}
