import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/screens/announcements/widgets/add_announcement_button.dart';
import 'package:saasify/screens/announcements/widgets/add_announcement_form.dart';
import 'package:saasify/widgets/layoutWidgets/background_card_widget.dart';
import 'package:saasify/widgets/layoutWidgets/responsive_layout.dart';
import 'package:saasify/widgets/layoutWidgets/screen_skeleton.dart';
import 'package:saasify/widgets/text/module_heading.dart';

class AddAnnouncementScreen extends StatelessWidget {
  static const routeName = 'AnnouncementScreen';

  AddAnnouncementScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ScreenSkeleton(childScreenBuilder: (isMobile) {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: spacingMedium),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: spacingMedium),
                child: Row(children: [
                  isMobile ? const SizedBox.shrink() : const BackButton(),
                  const SizedBox(width: spacingXMedium),
                  const ModuleHeading(label: "Add Announcement"),
                ])),
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                    key: _formKey,
                    child: ResponsiveLayout(
                        mobileBody: const AddAnnouncementForm(),
                        desktopBody: BackgroundCardWidget(
                          childScreen: Padding(
                            padding: const EdgeInsets.all(spacingMedium),
                            child: Column(
                              children: [
                                const AddAnnouncementForm(),
                                Row(
                                  children: [
                                    const Spacer(),
                                    AddAnnouncementButton(formKey: _formKey),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ))),
              ),
            ),
            isMobile ? const Divider(height: 0) : const SizedBox.shrink(),
            isMobile
                ? Container(
                    color: AppColors.white,
                    padding: const EdgeInsets.all(spacingStandard),
                    child: AddAnnouncementButton(
                        formKey: _formKey, buttonWidth: double.maxFinite))
                : const SizedBox.shrink()
          ]);
    });
  }
}
