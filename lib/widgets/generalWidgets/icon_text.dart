import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';

import '../../configs/app_colors.dart';
import '../../configs/app_spacing.dart';

class IconText extends StatelessWidget {
  final String text;
  final IconData icon;
  const IconText({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: AppColors.darkBlue, size: 16),
        const SizedBox(width: spacingXSmall),
        Expanded(
          child: Text(text,
              style: Theme.of(context).textTheme.subDetailTextStyle),
        ),
      ],
    );
  }
}
