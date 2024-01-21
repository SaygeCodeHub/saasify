import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';

import '../../configs/app_colors.dart';

class CircleCardIcon extends StatelessWidget {
  final IconData icon;
  final Color cardColor;
  const CircleCardIcon(
      {super.key, required this.icon, this.cardColor = AppColors.orange});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: const CircleBorder(),
      child: Padding(
        padding: const EdgeInsets.all(spacingXSmall),
        child: Icon(icon, color: cardColor, size: 20),
      ),
    );
  }
}
