import 'package:flutter/material.dart';
import 'package:saasify/widgets/layoutWidgets/screen_skeleton.dart';
import 'package:saasify/widgets/generalWidgets/value_card.dart';
import '../../../configs/app_spacing.dart';
import '../../../widgets/text/module_heading.dart';
import '../../utils/modules.dart';

class HRMSDashboardScreen extends StatelessWidget {
  static const routeName = 'HRMS';
  const HRMSDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenSkeleton(
        isHome: true,
        childScreenBuilder: (isMobile) => Padding(
            padding: const EdgeInsets.all(spacingLarge),
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                  const ModuleHeading(label: 'HRMS'),
                  const SizedBox(height: spacingXSmall),
                  GridView.extent(
                      shrinkWrap: true,
                      maxCrossAxisExtent: 250.0,
                      childAspectRatio: isMobile ? 1.4 : 1.8,
                      mainAxisSpacing: 8.0,
                      crossAxisSpacing: 8.0,
                      children: hrmsModules.map((item) {
                        return ValueCard(
                            cardHeading: item.cardHeading,
                            value: item.value,
                            iconPath: item.iconPath,
                            onTap: () {
                              item.onTap(context);
                            });
                      }).toList())
                ]))));
  }
}
