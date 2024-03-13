import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/configs/dashboard_route.dart';

class DrawerListTileWidget extends StatefulWidget {
  final Map<String, dynamic> module;

  const DrawerListTileWidget({super.key, required this.module});

  @override
  ModuleTileState createState() => ModuleTileState();
}

class ModuleTileState extends State<DrawerListTileWidget> {
  bool isExpanded = false;
  int selectedDestination = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          minLeadingWidth: spacingStandard,
          leading: const Icon(Icons.desktop_mac_outlined,color: AppColors.black),
          title: Text(widget.module['title'],
              style: Theme.of(context).textTheme.drawerModuleTextStyle),
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          trailing: isExpanded
              ? const Icon(Icons.arrow_drop_up)
              : const Icon(Icons.arrow_drop_down),
        ),
        if (isExpanded)
          Padding(
            padding: const EdgeInsets.only(left: spacingHuge),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.module['accessible_features'].length,
              itemBuilder: (context, index) {
                final feature = widget.module['accessible_features'][index];
                return FeatureTile(feature: feature);
              },
            ),
          ),
      ],
    );
  }
}

class FeatureTile extends StatelessWidget {
  final Map<String, dynamic> feature;

  const FeatureTile({super.key, required this.feature});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(feature['title']),
        onTap: () {
          DashboardRouting(
            featureKey: feature['feature_key'],
            context: context,
            actionType: feature['is_view'] ? "viewData" : "formScreen",
            endpoint: feature['build_screen_endpoint'],
          ).action();
        });
  }
}
