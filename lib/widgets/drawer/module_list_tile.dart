import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';

import '../../configs/app_spacing.dart';
import '../generalWidgets/custom_icon.dart';

class ModuleListTile extends StatelessWidget {
  final IconData iconData;
  final String title;
  final void Function()? onTap;

  const ModuleListTile(
      {super.key,
      required this.iconData,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomIcon(iconData: iconData),
          const SizedBox(width: spacingXMedium),
          Expanded(
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.15,
              child: Text(title,
                  style: Theme.of(context).textTheme.drawerModuleTextStyle,
                  maxLines: 2),
            ),
          ),
        ],
      ),
      onTap: onTap,
    );
  }
}
