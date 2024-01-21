import 'package:flutter/material.dart';

import '../../configs/app_colors.dart';

class CustomIcon extends StatelessWidget {
  final IconData iconData;
  final double? size;
  final Color? color;

  const CustomIcon({
    super.key,
    required this.iconData,
    this.size = 18.0,
    this.color = AppColors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      iconData,
      size: size,
      color: color,
    );
  }
}
