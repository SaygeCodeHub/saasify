import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/data/models/form/form_structure_model.dart';
import 'package:saasify/utils/form/form_widget_util.dart';
import 'package:saasify/widgets/formWidgets/field_container.dart';
import 'package:saasify/widgets/section_heading.dart';

class FormSection extends StatelessWidget {
  const FormSection({
    super.key,
    required this.sectionData,
  });

  final Section sectionData;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: spacingStandard),
      child: Padding(
        padding: const EdgeInsets.all(spacingStandard),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SectionHeading(label: sectionData.sectionName ?? ""),
          const SizedBox(height: spacingMedium),
          ...List.generate(sectionData.rows!.length, (rowIndex) {
            FieldRow rowData = sectionData.rows![rowIndex];
            return FieldContainer(
                childrenWidgets:
                    List.generate(rowData.fields?.length ?? 0, (fieldIndex) {
              Field fieldData = rowData.fields![fieldIndex];
              return RowField(
                flex: fieldData.flex ?? 1,
                widget: FormWidgetUtil().getWidget(fieldData),
              );
            }));
          }),
          const SizedBox(height: spacingStandard),
        ]),
      ),
    );
  }
}
