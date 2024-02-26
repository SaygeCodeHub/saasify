import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/widgets/layoutWidgets/screen_skeleton.dart';
import 'package:saasify/widgets/text/module_heading.dart';

class AllAnnouncementsScreen extends StatelessWidget {
  static const String routeName = 'AllAnnouncementsScreen';
  const AllAnnouncementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenSkeleton(childScreenBuilder: (isMobile) {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: spacingMedium),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: spacingMedium),
                  child: Row(children: [
                    isMobile ? const SizedBox.shrink() : const BackButton(),
                    const SizedBox(width: spacingXMedium),
                    const ModuleHeading(label: "Announcements")
                  ]))
            ]),
            Expanded(child: SizedBox.shrink())
          ]);
    });
  }
}
