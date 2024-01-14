import 'package:flutter/material.dart';
import '../../configs/app_colors.dart';
import '../../configs/app_spacing.dart';

class BackgroundCardWidget extends StatelessWidget {
  final Widget childScreen;

  const BackgroundCardWidget({super.key, required this.childScreen});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(spacingXMedium),
      child: Card(
        color: AppColors.white,
        child: childScreen,
      ),
    );
  }
}
