import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/buttonAction/button_action_bloc.dart';
import 'package:saasify/bloc/buttonAction/button_action_state.dart';
import 'package:saasify/bloc/form/form_bloc.dart';
import 'package:saasify/bloc/form/form_events.dart';
import 'package:saasify/bloc/form/form_states.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/data/models/form/form_structure_model.dart';
import 'package:saasify/utils/button_utils.dart';
import 'package:saasify/utils/progress_bar.dart';
import 'package:saasify/widgets/alertDialogs/error_alert_dialog.dart';
import 'package:saasify/widgets/alertDialogs/success_alert_dialog.dart';
import 'package:saasify/widgets/buttons/primary_button.dart';
import 'package:saasify/widgets/formWidgets/form_section.dart';
import 'package:saasify/widgets/layoutWidgets/screen_skeleton.dart';
import 'package:saasify/widgets/text/module_heading.dart';

class FormScreen extends StatelessWidget {
  static const routeName = 'FormScreen';

  final String endpoint;

  const FormScreen({super.key, required this.endpoint});

  @override
  Widget build(BuildContext context) {
    context.read<FormBloc>().add(BuildForm(endpoint: endpoint));
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
              padding: const EdgeInsets.only(
                  left: spacingStandard,
                  right: spacingStandard,
                  top: spacingStandard),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        isMobile
                            ? const SizedBox.shrink()
                            : IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.arrow_back_ios)),
                        ModuleHeading(
                            label: state.formStructureModel.data?.formName ??
                                "Form"),
                        const Spacer(),
                        ...List.generate(
                            state.formStructureModel.data?.utilityButtons
                                    ?.length ??
                                0,
                            (index) => IconButton(
                                onPressed: () {},
                                icon: Icon(ButtonUtils.getButtonIconFromType(
                                    state
                                            .formStructureModel
                                            .data
                                            ?.utilityButtons?[index]
                                            .buttonIcon ??
                                        ""))))
                      ],
                    ),
                    const SizedBox(height: spacingStandard),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(
                                state.formStructureModel.data!.sections!.length,
                                (sectionIndex) {
                              Section sectionData = state.formStructureModel
                                  .data!.sections![sectionIndex];
                              return FormSection(sectionData: sectionData);
                            })),
                      ),
                    ),
                    const Divider(height: 0),
                    BlocListener<ButtonActionBloc, ButtonActionStates>(
                      listener: (context, state) {
                        if (state is ButtonActionLoading) {
                          ProgressBar.show(context);
                        }
                        if (state is ButtonActionSuccess) {
                          ProgressBar.dismiss(context);
                          showDialog(
                              context: context,
                              builder: (context) {
                                return const SuccessAlertDialog(
                                    description: "Button action successful");
                              });
                        }
                        if (state is ButtonActionFailure) {
                          ProgressBar.dismiss(context);
                          showDialog(
                              context: context,
                              builder: (context) {
                                return ErrorAlertDialog(
                                    description: state.error);
                              });
                        }
                      },
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: spacingStandard,
                              vertical: spacingSmall),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: List.generate(
                                  state.formStructureModel.data?.buttons
                                          ?.length ??
                                      0, (index) {
                                final button = state
                                    .formStructureModel.data?.buttons?[index];
                                return isMobile
                                    ? Expanded(
                                        child: PrimaryButton(
                                        onPressed: () {
                                          final data =
                                              state.formStructureModel.toJson();
                                          ButtonUtils.buttonAction(context,
                                              button ?? Button(), data);
                                        },
                                        buttonTitle: state
                                                .formStructureModel
                                                .data
                                                ?.buttons?[index]
                                                .buttonName ??
                                            "Submit",
                                      ))
                                    : PrimaryButton(
                                        buttonWidth: kGeneralActionButtonWidth,
                                        onPressed: () {
                                          final data = state
                                                  .formStructureModel.data
                                                  ?.toJson() ??
                                              {};
                                          ButtonUtils.buttonAction(context,
                                              button ?? Button(), data);
                                        },
                                        buttonTitle: state
                                                .formStructureModel
                                                .data
                                                ?.buttons?[index]
                                                .buttonName ??
                                            "Submit",
                                      );
                              }))),
                    )
                  ]));
        }
        return const SizedBox.shrink();
      });
    });
  }
}
