import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/utils/modules.dart';
import 'package:saasify/widgets/generalWidgets/service_card.dart';
import 'package:saasify/widgets/layoutWidgets/screen_skeleton.dart';
import 'package:saasify/widgets/generalWidgets/value_card.dart';
import 'package:saasify/widgets/text/module_heading.dart';

class HRMSDashboardScreen extends StatelessWidget {
  static const routeName = 'HRMS';

  const HRMSDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenSkeleton(
        isHome: true,
        childScreenBuilder: (isMobile) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacingLarge),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: spacingStandard),
                    const ModuleHeading(label: 'Statistics'),
                    const SizedBox(height: spacingXSmall),
                    GridView.extent(
                        shrinkWrap: true,
                        maxCrossAxisExtent: 250.0,
                        childAspectRatio: isMobile ? 1.4 : 2,
                        mainAxisSpacing: 8.0,
                        crossAxisSpacing: 8.0,
                        children: statisticsModules.map((item) {
                          return ValueCard(
                              cardHeading: item.cardHeading,
                              value: item.value,
                              iconData: item.iconData,
                              onTap: () {
                                item.onTap(context);
                              });
                        }).toList()),
                    const SizedBox(height: spacingLarge),
                    const Divider(),
                    const SizedBox(height: spacingLarge),
                    const ModuleHeading(label: 'Quick Services'),
                    const SizedBox(height: spacingStandard),
                    GridView.extent(
                        shrinkWrap: true,
                        maxCrossAxisExtent: 250.0,
                        childAspectRatio: isMobile ? 1.4 : 2.3,
                        mainAxisSpacing: 8.0,
                        crossAxisSpacing: 8.0,
                        children: hrmsModules.map((item) {
                          return ServiceCard(
                              cardHeading: item.cardHeading,
                              iconData: item.iconData,
                              onTap: () {
                                item.onTap(context);
                              });
                        }).toList())
                  ]),
            )));
  }
}
