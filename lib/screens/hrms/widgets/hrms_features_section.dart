import 'package:flutter/material.dart';
import 'package:saasify/caches/cache.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/dashboard_route.dart';
import 'package:saasify/data/models/initialise/initialise_app_model.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/widgets/generalWidgets/value_card.dart';
import 'package:saasify/widgets/text/module_heading.dart';

class HrmsFeaturesSection extends StatelessWidget {
  final bool isMobile;
  const HrmsFeaturesSection({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    List<FeatureDetailModel> features = [];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ModuleHeading(label: 'Features'),
        const SizedBox(height: spacingStandard),
        FutureBuilder(
            future: getIt<Cache>().getAccessibleModules(),
            builder: (context, snapshot) {
              features.clear();
              if (snapshot.hasData) {
                snapshot.data?.forEach((element) {
                  if (element.moduleKey == 'HR') {
                    features.addAll(element.accessibleFeatures!);
                  }
                });
                return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isMobile ? 2 : 5,
                      mainAxisSpacing: 8.0,
                      crossAxisSpacing: 8.0,
                      childAspectRatio: isMobile ? 1.4 : 1.9),
                  itemCount: features.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          DashboardRouting(
                                  featureKey:
                                      features[index].featureKey.toString(),
                                  context: context)
                              .navigateTo();
                        },
                        child: ValueCard(
                            cardHeading: features[index].title.toString(),
                            value: features[index].value.toString(),
                            iconData: features[index].icon.toString()));
                  },
                );
              } else {
                return const CircularProgressIndicator();
              }
            })
      ],
    );
  }
}
