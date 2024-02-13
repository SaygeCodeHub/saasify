import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/screens/task/task_mobile_screen.dart';
import 'package:saasify/widgets/buttons/primary_button.dart';
import 'package:saasify/widgets/layoutWidgets/responsive_layout.dart';
import 'package:saasify/widgets/layoutWidgets/screen_skeleton.dart';
import 'package:saasify/widgets/text/module_heading.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/configs/app_colors.dart';

class TaskScreen extends StatefulWidget {
  static const routeName = 'TaskScreen';

  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: AppColors.white,
        child: Padding(
          padding: const EdgeInsets.all(spacingStandard),
          child: PrimaryButton(onPressed: () {}, buttonTitle: 'Assign'),
        ),
      ),
      body: ScreenSkeleton(
          childScreenBuilder: (bool isMobile) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: spacingMedium),
                  Padding(
                      padding: const EdgeInsets.only(
                          left: spacingMedium, right: spacingMedium),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const ModuleHeading(label: 'Assign new task'),
                            (isMobile)
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                        Text('High Priority',
                                            style: Theme.of(context)
                                                .textTheme
                                                .drawerModuleTextStyle),
                                        Checkbox(
                                            isError: true,
                                            hoverColor: AppColors.grey,
                                            activeColor: AppColors.orange,
                                            value: isChecked,
                                            onChanged: (value) {
                                              setState(() {
                                                isChecked = value!;
                                              });
                                            })
                                      ])
                                : const SizedBox.shrink()
                          ])),
                  const Expanded(
                      child: ResponsiveLayout(
                          mobileBody: AssignTaskMobileScreen(),
                          desktopBody: AssignTaskMobileScreen()))
                ],
              )),
    );
  }
}
