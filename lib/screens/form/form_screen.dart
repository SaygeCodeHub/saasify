import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/form/form_bloc.dart';
import 'package:saasify/bloc/form/form_events.dart';
import 'package:saasify/bloc/form/form_states.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/form/form_structure_model.dart';
import 'package:saasify/utils/form/form_widget_util.dart';
import 'package:saasify/widgets/formWidgets/field_row.dart';
import 'package:saasify/widgets/layoutWidgets/screen_skeleton.dart';
import 'package:saasify/widgets/text/module_heading.dart';

class FormScreen extends StatelessWidget {
  static const routeName = 'FormScreen';

  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<FormBloc>().add(BuildForm());
    return ScreenSkeleton(childScreenBuilder: (isMobile) {
      return BlocBuilder<FormBloc, FormStates>(builder: (context, state) {
        if (state is FormStructureFetching) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is FormBuildFailure) {
          return const Center(
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
                        label:
                            state.formStructureModel.data?.formName ?? "Form"),
                    const SizedBox(height: spacingStandard),
                    Expanded(
                      child: Card(
                          child: Padding(
                              padding: const EdgeInsets.all(spacingStandard),
                              child: SingleChildScrollView(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: List.generate(
                                        state.formStructureModel.data!.sections!
                                            .length, (sectionIndex) {
                                      Section sectionData = state
                                          .formStructureModel
                                          .data!
                                          .sections![sectionIndex];
                                      return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SectionHeading(
                                              label: sectionData.sectionName ??
                                                  "Section",
                                            ),
                                            const SizedBox(
                                                height: spacingMedium),
                                            ...List.generate(
                                                sectionData.rows!.length,
                                                (rowIndex) {
                                              FieldRow rowData =
                                                  sectionData.rows![rowIndex];
                                              return Column(
                                                children: [
                                                  FieldContainer(
                                                      childrenWidgets:
                                                          List.generate(
                                                              rowData.fields
                                                                      ?.length ??
                                                                  0,
                                                              (fieldIndex) {
                                                    Field fieldData = rowData
                                                        .fields![fieldIndex];
                                                    return RowField(
                                                      flex: fieldData.flex ?? 1,
                                                      widget: FormWidgetUtil()
                                                          .getWidget(
                                                              fieldData, {}),
                                                    );
                                                  })),
                                                  const SizedBox(
                                                      height: spacingStandard)
                                                ],
                                              );
                                            }),
                                            const SizedBox(
                                                height: spacingStandard),
                                          ]);
                                    })),
                              ))),
                    )
                  ]));
        }
        return const SizedBox.shrink();
      });
    });
  }
}

class SectionHeading extends StatelessWidget {
  final String? label;

  const SectionHeading({super.key, this.label});

  @override
  Widget build(BuildContext context) {
    return Text(label!,
        style: Theme.of(context).textTheme.formSectionHeadingTextStyle);
  }
}
