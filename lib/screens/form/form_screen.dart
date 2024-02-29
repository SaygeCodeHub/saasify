import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/form/form_bloc.dart';
import 'package:saasify/bloc/form/form_events.dart';
import 'package:saasify/bloc/form/form_states.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/data/models/form/form_structure_model.dart';
import 'package:saasify/widgets/layoutWidgets/multifield_row.dart';
import 'package:saasify/widgets/layoutWidgets/screen_skeleton.dart';
import 'package:saasify/widgets/text/field_label_widget.dart';
import 'package:saasify/widgets/text/module_heading.dart';

class FormScreen extends StatelessWidget {
  static const routeName = 'FormScreen';

  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<FormBloc>().add(BuildForm());
    return ScreenSkeleton(childScreenBuilder: (isMobile) {
      return BlocBuilder<FormBloc, FormStates>(
        builder: (context, state) {
          if (state is FormStructureFetching) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is FormBuildFailure) {
            return Center(
              child: Text('Failed to fetch form'),
            );
          }
          if (state is FormAssembled) {
            return Padding(
              padding: const EdgeInsets.all(spacingStandard),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ModuleHeading(
                      label: state.formStructureModel.data?.formName ?? "Form"),
                  const SizedBox(height: spacingStandard),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(spacingStandard),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                            state.formStructureModel.data!.sections!.length,
                            (sectionIndex) {
                          Section sectionData = state
                              .formStructureModel.data!.sections![sectionIndex];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                sectionData.sectionName ?? "Section",
                              ),
                              ...List.generate(sectionData.fields!.length,
                                  (rowIndex) {
                                Field rowData = sectionData.fields![rowIndex];
                                return MultiFieldRow(
                                    childrenWidgets: List.generate(
                                        rowData.rowFields?.length ?? 0,
                                        (fieldIndex) {
                                  RowField fieldData =
                                      rowData.rowFields![fieldIndex];
                                  return LabelAndFieldWidget(
                                    label: fieldData.label,
                                  );
                                }));
                              })
                            ],
                          );
                        }),
                      ),
                    ),
                  )
                ],
              ),
            );
          }
          return SizedBox.shrink();
        },
      );
    });
  }
}
