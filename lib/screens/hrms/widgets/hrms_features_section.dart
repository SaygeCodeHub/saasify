import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/initialise/initialise_bloc.dart';
import 'package:saasify/caches/cache.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/dashboard_route.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/utils/icon_mapping.dart';
import 'package:saasify/widgets/generalWidgets/value_card.dart';
import 'package:saasify/widgets/text/module_heading.dart';

import '../../../utils/globals.dart';

class HrmsFeaturesSection extends StatelessWidget {
  final bool isMobile;

  const HrmsFeaturesSection({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    bool isTab = MediaQuery.of(context).size.width < tabBreakPoint;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const ModuleHeading(label: 'Features'),
      const SizedBox(height: spacingStandard),
      FutureBuilder(
          future: getIt<Cache>().getAccessibleModules(),
          builder: (context, snapshot) {
            context.read<InitialiseAppBloc>().hrmsAccessibleFeatures.clear();
            if (snapshot.hasData) {
              snapshot.data?.forEach((element) {
                if (element.moduleKey == 'HR') {
                  context
                      .read<InitialiseAppBloc>()
                      .hrmsAccessibleFeatures
                      .addAll(element.accessibleFeatures!
                          .where((element) => element.featureId != 0.0)
                          .where((element) => element.featureId != 0.2));
                }
              });
              return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isMobile
                          ? 2
                          : isTab
                              ? 4
                              : 5,
                      mainAxisSpacing: 8.0,
                      crossAxisSpacing: 8.0,
                      childAspectRatio: isMobile
                          ? 1.4
                          : isTab
                              ? 1.68
                              : 2),
                  itemCount: context
                      .read<InitialiseAppBloc>()
                      .hrmsAccessibleFeatures
                      .length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          DashboardRouting(
                                  featureKey: context
                                      .read<InitialiseAppBloc>()
                                      .hrmsAccessibleFeatures[index]
                                      .featureKey
                                      .toString(),
                                  context: context)
                              .navigateTo();
                        },
                        child: ValueCard(
                            cardHeading: context
                                .read<InitialiseAppBloc>()
                                .hrmsAccessibleFeatures[index]
                                .title
                                .toString(),
                            value: context
                                .read<InitialiseAppBloc>()
                                .hrmsAccessibleFeatures[index]
                                .value
                                .toString(),
                            iconData: iconMapping(context
                                .read<InitialiseAppBloc>()
                                .hrmsAccessibleFeatures[index]
                                .featureKey
                                .toString())));
                  });
            } else {
              return const CircularProgressIndicator();
            }
          })
    ]);
  }
}
