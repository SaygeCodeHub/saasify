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
import 'package:saasify/data/models/screenArguments/no_data_screen_arguments.dart';
import 'package:saasify/screens/generalScreens/no_data_found_screen.dart';
import 'package:saasify/utils/button_utils.dart';
import 'package:saasify/utils/progress_bar.dart';
import 'package:saasify/widgets/alertDialogs/error_alert_dialog.dart';
import 'package:saasify/widgets/alertDialogs/success_alert_dialog.dart';
import 'package:saasify/widgets/buttons/back_button.dart';
import 'package:saasify/widgets/formWidgets/form_section.dart';
import 'package:saasify/widgets/layoutWidgets/screen_skeleton.dart';
import 'package:saasify/widgets/text/module_heading.dart';

class FormScreen extends StatelessWidget {
  static const routeName = 'FormScreen';

  final String endpoint;

  FormScreen({super.key, required this.endpoint});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    context.read<FormBloc>().add(BuildForm(endpoint: endpoint));
    return ScreenSkeleton(childScreenBuilder: (isMobile) {
      return BlocConsumer<FormBloc, FormStates>(listener: (context, state) {
        if (state is FormBuildFailure) {
          Navigator.pushReplacementNamed(context, NoDataFoundScreen.routeName,
              arguments: NoDataScreenArguments(
                  heading: state.error, message: state.error));
        }
      }, builder: (context, state) {
        if (state is FormStructureFetching) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is FormBuildFailure) {
          return Center(child: Text(state.error));
        }
        if (state is FormAssembled) {
          return Form(
              key: _formKey,
              child: Padding(
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
                                : CustomBackButton(onPressed: () {
                                    Navigator.pop(context);
                                  }),
                            ModuleHeading(
                                label:
                                    state.formStructureModel.data?.formName ??
                                        ""),
                            const Spacer(),
                            ...List.generate(
                                state.formStructureModel.data?.utilityButtons
                                        ?.length ??
                                    0, (index) {
                              UtilityButton button = state.formStructureModel
                                  .data!.utilityButtons![index];
                              return IconButton(
                                  onPressed: () {
                                    ButtonUtils.buttonAction(context,
                                        state.formStructureModel.data!.toJson(),
                                        buttonAction: button.buttonAction,
                                        endPoint: button.endPoint,
                                        apiMethodType: button.apiMethodType);
                                  },
                                  icon: ButtonUtils.getButtonIconFromType(state
                                          .formStructureModel
                                          .data
                                          ?.utilityButtons?[index]
                                          .buttonIcon ??
                                      ""));
                            })
                          ],
                        ),
                        const SizedBox(height: spacingStandard),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: List.generate(
                                    state.formStructureModel.data!.sections!
                                        .length, (sectionIndex) {
                                  Section sectionData = state.formStructureModel
                                      .data!.sections![sectionIndex];
                                  return FormSection(sectionData: sectionData);
                                })),
                          ),
                        ),
                        const Divider(height: 0),
                        Builder(builder: (context) {
                          List<Button> buttons =
                              state.formStructureModel.data?.buttons ?? [];
                          return BlocListener<ButtonActionBloc,
                                  ButtonActionStates>(
                              listener: (context, state) {
                                if (state is ButtonActionLoading) {
                                  ProgressBar.show(context);
                                }
                                if (state is ButtonActionSuccess) {
                                  ProgressBar.dismiss(context);
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Center(
                                          child: SuccessAlertDialog(
                                              description: state.message,
                                              onPressed: () {
                                                Navigator.pop(context);
                                                Navigator.pop(context);
                                              }),
                                        );
                                      });
                                }
                                if (state is ButtonActionFailure) {
                                  ProgressBar.dismiss(context);
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Center(
                                          child: ErrorAlertDialog(
                                              description: state.error),
                                        );
                                      });
                                }
                              },
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: spacingStandard,
                                      vertical: spacingSmall),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: List.generate(buttons.length,
                                          (index) {
                                        final button = buttons[index];
                                        return isMobile
                                            ? Expanded(
                                                child: ButtonUtils.getButtonFromType(
                                                    context,
                                                    buttonType:
                                                        button.buttonType ?? "primary",
                                                    onPressed: () {
                                                Map<String, dynamic> data =
                                                    state.formStructureModel
                                                            .data
                                                            ?.toJson() ??
                                                        {};
                                                if (_formKey.currentState!
                                                    .validate()) {
                                                  ButtonUtils.buttonAction(
                                                      context, data,
                                                      buttonAction:
                                                          button.buttonAction,
                                                      endPoint: button.endPoint,
                                                      apiMethodType:
                                                          button.apiMethodType);
                                                }
                                              },
                                                    buttonTitle: buttons[index]
                                                            .buttonName ??
                                                        "Submit"))
                                            : ButtonUtils.getButtonFromType(context,
                                                width:
                                                    kGeneralActionButtonWidth,
                                                buttonType: button.buttonType ??
                                                    "primary", onPressed: () {
                                                Map<String, dynamic> data =
                                                    state.formStructureModel
                                                            .data
                                                            ?.toJson() ??
                                                        {};
                                                if (_formKey.currentState!
                                                    .validate()) {
                                                  ButtonUtils.buttonAction(
                                                      context, data,
                                                      buttonAction:
                                                          button.buttonAction,
                                                      endPoint: button.endPoint,
                                                      apiMethodType:
                                                          button.apiMethodType);
                                                }
                                              }, buttonTitle: buttons[index].buttonName ?? "Submit");
                                      }))));
                        })
                      ])));
        }
        return const SizedBox.shrink();
      });
    });
  }
}
