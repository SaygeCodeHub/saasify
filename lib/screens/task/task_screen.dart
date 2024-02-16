import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/screens/task/widgets/assign_task_button.dart';
import 'package:saasify/screens/task/widgets/assign_task_form.dart';
import 'package:saasify/widgets/layoutWidgets/background_card_widget.dart';
import 'package:saasify/widgets/layoutWidgets/responsive_layout.dart';
import 'package:saasify/widgets/layoutWidgets/screen_skeleton.dart';
import 'package:saasify/widgets/text/module_heading.dart';

class TaskScreen extends StatelessWidget {
  static const routeName = 'TaskScreen';

  TaskScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ScreenSkeleton(childScreenBuilder: (isMobile) {
      return SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: spacingMedium),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: spacingMedium),
                  child: Row(children: [
                    isMobile ? const SizedBox.shrink() : const BackButton(),
                    const SizedBox(width: spacingXMedium),
                    const ModuleHeading(label: "Assign Task"),
                  ])),
              Form(
                  key: _formKey,
                  child: ResponsiveLayout(
                      mobileBody: const AssignTaskForm(),
                      desktopBody: BackgroundCardWidget(
                        childScreen: Padding(
                          padding: const EdgeInsets.all(spacingMedium),
                          child: Column(
                            children: [
                              const AssignTaskForm(),
                              Row(
                                children: [
                                  const Spacer(),
                                  AssignTaskButton(formKey: _formKey),
                                ],
                              )
                            ],
                          ),
                        ),
                      ))),
              isMobile ? const Divider(height: 0) : const SizedBox.shrink(),
              isMobile
                  ? Container(
                      color: AppColors.white,
                      padding: const EdgeInsets.all(spacingStandard),
                      child: AssignTaskButton(formKey: _formKey))
                  : const SizedBox.shrink()
            ]),
      );
    });
  }
}
