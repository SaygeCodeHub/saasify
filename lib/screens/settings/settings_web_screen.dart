import 'package:flutter/material.dart';
import 'package:saasify/widgets/layoutWidgets/background_card_widget.dart';
import 'package:saasify/widgets/text/field_label_widget.dart';
import '../../configs/app_spacing.dart';
import '../../widgets/multifield_row.dart';
import '../../widgets/text/module_heading.dart';

class SettingsWebScreen extends StatelessWidget {
  const SettingsWebScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BackgroundCardWidget(
        childScreen: Padding(
      padding: EdgeInsets.all(spacingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: spacingLarge, top: spacingXXSmall),
            child: ModuleHeading(label: 'Address & Location'),
          ),
          MultiFieldRow(
            childrenWidgets: [
              Expanded(child: LabelAndFieldWidget(label: 'Branch Address')),
              SizedBox(width: spacingLarge),
              Expanded(child: LabelAndFieldWidget(label: 'Branch Latitude')),
              SizedBox(width: spacingLarge),
              Expanded(child: LabelAndFieldWidget(label: 'Branch Longitude')),
              SizedBox(width: spacingLarge),
              Expanded(child: LabelAndFieldWidget(label: 'Branch PinCode')),
            ],
          ),
          SizedBox(height: spacingLarge),
          Divider(),
          SizedBox(height: spacingMedium),
          Padding(
            padding: EdgeInsets.only(bottom: spacingLarge, top: spacingXXSmall),
            child: ModuleHeading(label: 'General Settings'),
          ),
          MultiFieldRow(childrenWidgets: [
            Expanded(child: LabelAndFieldWidget(label: 'Default Approver')),
            SizedBox(width: spacingLarge),
            Expanded(child: LabelAndFieldWidget(label: 'Time In')),
            SizedBox(width: spacingLarge),
            Expanded(child: LabelAndFieldWidget(label: 'Time Out')),
            SizedBox(width: spacingLarge),
            Expanded(child: LabelAndFieldWidget(label: 'Currency')),
          ]),
          SizedBox(height: spacingLarge),
          Divider(),
          Padding(
            padding: EdgeInsets.only(bottom: spacingLarge, top: spacingXXSmall),
            child: ModuleHeading(label: 'Leaves Settings'),
          ),
          SizedBox(height: spacingLarge),
          MultiFieldRow(
            childrenWidgets: [
              Expanded(child: LabelAndFieldWidget(label: 'No of working days')),
              SizedBox(width: spacingLarge),
              Expanded(
                  child: LabelAndFieldWidget(label: 'Total Medical Leaves')),
              SizedBox(width: spacingLarge),
              Expanded(
                  child: LabelAndFieldWidget(label: 'Total Casual Leaves')),
              SizedBox(width: spacingLarge),
              Expanded(child: LabelAndFieldWidget(label: 'Overtime rate')),
              SizedBox(width: spacingLarge),
              Expanded(child: LabelAndFieldWidget(label: 'Overtime rate per')),
            ],
          )
        ],
      ),
    ));
  }
}
