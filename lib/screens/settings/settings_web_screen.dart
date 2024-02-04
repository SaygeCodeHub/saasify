import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/settings/settings_bloc.dart';
import 'package:saasify/widgets/layoutWidgets/background_card_widget.dart';
import 'package:saasify/widgets/text/field_label_widget.dart';
import '../../configs/app_spacing.dart';
import '../../widgets/layoutWidgets/multifield_row.dart';
import '../../widgets/text/module_heading.dart';

class SettingsWebScreen extends StatelessWidget {
  const SettingsWebScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundCardWidget(
        childScreen: Padding(
      padding: const EdgeInsets.all(spacingMedium),
      child: ValueListenableBuilder<bool>(
        valueListenable: context.read<SettingsBloc>().isEdit,
        builder: (BuildContext context, bool value, Widget? child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                  padding: EdgeInsets.only(
                      bottom: spacingLarge, top: spacingXXSmall),
                  child: ModuleHeading(label: 'Address & Location')),
              MultiFieldRow(
                childrenWidgets: [
                  LabelAndFieldWidget(
                      label: 'Branch Address', readOnly: !value),
                  const SizedBox(width: spacingLarge),
                  LabelAndFieldWidget(
                      label: 'Branch Latitude', readOnly: !value),
                  const SizedBox(width: spacingLarge),
                  const LabelAndFieldWidget(label: 'Branch Longitude'),
                  const SizedBox(width: spacingLarge),
                  const LabelAndFieldWidget(label: 'Branch PinCode'),
                ],
              ),
              const SizedBox(height: spacingLarge),
              const Divider(),
              const SizedBox(height: spacingMedium),
              const Padding(
                padding:
                    EdgeInsets.only(bottom: spacingLarge, top: spacingXXSmall),
                child: ModuleHeading(label: 'General Settings'),
              ),
              const MultiFieldRow(childrenWidgets: [
                LabelAndFieldWidget(label: 'Default Approver'),
                SizedBox(width: spacingLarge),
                LabelAndFieldWidget(label: 'Time In'),
                SizedBox(width: spacingLarge),
                LabelAndFieldWidget(label: 'Time Out'),
                SizedBox(width: spacingLarge),
                LabelAndFieldWidget(label: 'Currency'),
              ]),
              const SizedBox(height: spacingLarge),
              const Divider(),
              const Padding(
                  padding: EdgeInsets.only(
                      bottom: spacingLarge, top: spacingXXSmall),
                  child: ModuleHeading(label: 'Leaves Settings')),
              const SizedBox(height: spacingLarge),
              const MultiFieldRow(
                childrenWidgets: [
                  LabelAndFieldWidget(label: 'No of working days'),
                  SizedBox(width: spacingLarge),
                  LabelAndFieldWidget(label: 'Total Medical Leaves'),
                  SizedBox(width: spacingLarge),
                  LabelAndFieldWidget(label: 'Total Casual Leaves'),
                  SizedBox(width: spacingLarge),
                  LabelAndFieldWidget(label: 'Overtime rate'),
                  SizedBox(width: spacingLarge),
                  LabelAndFieldWidget(label: 'Overtime rate per'),
                ],
              )
            ],
          );
        },
      ),
    ));
  }
}
