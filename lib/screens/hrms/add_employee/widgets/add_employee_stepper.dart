import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/screens/hrms/add_employee/widgets/add_employee_button.dart';
import 'package:saasify/widgets/buttons/primary_button.dart';
import 'package:saasify/widgets/buttons/secondary_button.dart';

class AddEmployeeStepper extends StatefulWidget {
  final List<StepData> steps;
  final bool isMobile;
  final bool isViewOnly;
  final List<GlobalKey<FormState>> formKeys;

  const AddEmployeeStepper(
      {super.key,
      required this.formKeys,
      required this.steps,
      required this.isMobile,
      this.isViewOnly = false});

  @override
  State<AddEmployeeStepper> createState() => _AddEmployeeStepperState();
}

class _AddEmployeeStepperState extends State<AddEmployeeStepper> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
          child: Stepper(
              type: StepperType.horizontal,
              currentStep: currentStep,
              controlsBuilder:
                  (BuildContext context, ControlsDetails controlsDetails) {
                return const SizedBox.shrink();
              },
              stepIconBuilder: (int index, StepState state) {
                return widget.steps[index].icon == null
                    ? Text((index + 1).toString(),
                        style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600))
                    : Icon(widget.steps[index].icon,
                        size: 14, color: AppColors.white);
              },
              onStepTapped: (step) {
                setState(() {
                  currentStep = step;
                });
                // Ajay: Validations commented for now
                // if (!widget.isViewOnly) {
                //   if (step > currentStep) {
                //     if ((widget.formKeys[currentStep].currentState
                //             ?.validate() ??
                //         false)) {
                //       if (step - currentStep == 1) {
                //         setState(() {
                //           currentStep = step;
                //         });
                //       }
                //     }
                //   } else {
                //     setState(() {
                //       currentStep = step;
                //     });
                //   }
                // } else {
                //   setState(() {
                //     currentStep = step;
                //   });
                // }
              },
              steps: widget.steps
                  .map((e) => Step(
                      title: e.header,
                      content: Form(
                          key: widget.formKeys[widget.steps.indexOf(e)],
                          child: e.content),
                      isActive: currentStep >= widget.steps.indexOf(e)))
                  .toList())),
      const Divider(height: 1),
      Padding(
          padding: const EdgeInsets.symmetric(
              vertical: spacingSmall, horizontal: spacingStandard),
          child: Column(
            children: [
              widget.isMobile
                  ? Row(
                      children: [
                        Expanded(
                            child: SecondaryButton(
                                buttonWidth: kGeneralActionButtonWidth,
                                onPressed: currentStep > 0
                                    ? () {
                                        setState(() {
                                          if (currentStep > 0) {
                                            currentStep--;
                                          }
                                        });
                                      }
                                    : null,
                                buttonTitle: 'Back')),
                        const SizedBox(width: spacingStandard),
                        Expanded(
                            child: SecondaryButton(
                                buttonWidth: kGeneralActionButtonWidth,
                                onPressed: currentStep < 3
                                    ? () {
                                        if (widget.formKeys[currentStep]
                                                .currentState
                                                ?.validate() ??
                                            false) {
                                          setState(() {
                                            if (currentStep < 3) {
                                              currentStep++;
                                            }
                                          });
                                        }
                                        // Ajay: Validations commented for now
                                        // if (!widget.isViewOnly) {
                                        //   if (widget.formKeys[currentStep].currentState
                                        //           ?.validate() ??
                                        //       false) {
                                        //     setState(() {
                                        //       if (currentStep < 3) {
                                        //         currentStep++;
                                        //       }
                                        //     });
                                        //   }
                                        // } else {
                                        //   setState(() {
                                        //     if (currentStep < 3) {
                                        //       currentStep++;
                                        //     }
                                        //   });
                                        // }
                                      }
                                    : null,
                                buttonTitle: 'Next'))
                      ],
                    )
                  : Row(
                      mainAxisAlignment: widget.isMobile
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.end,
                      children: [
                          SecondaryButton(
                              buttonWidth: kGeneralActionButtonWidth,
                              onPressed: currentStep > 0
                                  ? () {
                                      setState(() {
                                        if (currentStep > 0) {
                                          currentStep--;
                                        }
                                      });
                                    }
                                  : null,
                              buttonTitle: 'Back'),
                          widget.isViewOnly
                              ? const SizedBox.shrink()
                              : const SizedBox(width: spacingStandard),
                          widget.isViewOnly
                              ? const SizedBox.shrink()
                              : AddEmployeeButton(
                                  buttonWidth: kGeneralActionButtonWidth,
                                  isSaveAndNext: currentStep < 3,
                                  formKey: widget.formKeys.first),
                          const SizedBox(width: spacingStandard),
                          PrimaryButton(
                              buttonWidth: kGeneralActionButtonWidth,
                              onPressed: currentStep < 3
                                  ? () {
                                      if (widget.formKeys[currentStep]
                                              .currentState
                                              ?.validate() ??
                                          false) {
                                        setState(() {
                                          if (currentStep < 3) {
                                            currentStep++;
                                          }
                                        });
                                      }
                                      // Ajay: Validations commented for now
                                      // if (!widget.isViewOnly) {
                                      //   if (widget.formKeys[currentStep].currentState
                                      //           ?.validate() ??
                                      //       false) {
                                      //     setState(() {
                                      //       if (currentStep < 3) {
                                      //         currentStep++;
                                      //       }
                                      //     });
                                      //   }
                                      // } else {
                                      //   setState(() {
                                      //     if (currentStep < 3) {
                                      //       currentStep++;
                                      //     }
                                      //   });
                                      // }
                                    }
                                  : null,
                              buttonTitle: 'Next')
                        ]),
              widget.isMobile
                  ? widget.isViewOnly
                      ? const SizedBox.shrink()
                      : const SizedBox(height: spacingStandard)
                  : const SizedBox.shrink(),
              widget.isMobile
                  ? widget.isViewOnly
                      ? const SizedBox.shrink()
                      : AddEmployeeButton(
                          isSaveAndNext: currentStep < 3,
                          formKey: widget.formKeys.first)
                  : const SizedBox(height: spacingStandard),
            ],
          ))
    ]);
  }
}

class StepData {
  final Widget content;
  final Widget header;
  final String label;
  final IconData? icon;

  StepData({this.icon, this.label = "", required this.content})
      : header = label == ""
            ? const SizedBox.shrink()
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: spacingSmall),
                child: Text(label,
                    style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkBlue)),
              );
}
