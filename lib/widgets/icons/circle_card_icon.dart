import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';

import '../../configs/app_colors.dart';

class CircleCardIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double size;
  const CircleCardIcon(
      {super.key,
      required this.icon,
      this.color = AppColors.orange,
      this.size = 20});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: const CircleBorder(),
      child: Padding(
        padding: const EdgeInsets.all(spacingXSmall),
        child: Icon(icon, color: color, size: size),
      ),
    );
  }
}
