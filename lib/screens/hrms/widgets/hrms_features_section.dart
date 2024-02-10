import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/data/models/initialise/initialise_app_model.dart';
import 'package:saasify/widgets/text/module_heading.dart';
import 'package:saasify/widgets/generalWidgets/value_card.dart';
import 'package:saasify/configs/dashboard_route.dart';

class HrmsFeaturesSection extends StatelessWidget {
  final bool isMobile;
  final InitialiseAppModel initialiseAppModel;
  const HrmsFeaturesSection(
      {super.key, required this.isMobile, required this.initialiseAppModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ModuleHeading(label: 'Features'),
        const SizedBox(height: spacingStandard),
        GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 2 : 5,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              childAspectRatio: isMobile ? 1.4 : 1.9),
          itemCount: initialiseAppModel.data!.accessibleFeatures!.length,
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {
                  DashboardRouting(
                          featureKey: initialiseAppModel
                              .data!.accessibleFeatures![index].featureKey!,
                          context: context)
                      .navigateTo();
                },
                child: ValueCard(
                    cardHeading: initialiseAppModel
                        .data!.accessibleFeatures![index].title
                        .toString(),
                    value: initialiseAppModel
                        .data!.accessibleFeatures![index].value
                        .toString(),
                    iconData: initialiseAppModel
                        .data!.accessibleFeatures![index].title
                        .toString()));
          },
        ),
      ],
    );
  }
}
