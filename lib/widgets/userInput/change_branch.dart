import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';

class ChangeBranch extends StatelessWidget {
  const ChangeBranch({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.store, color: AppColors.lightBlue),
        const SizedBox(
          width: spacingSmall,
        ),
        const Text('Khamla'),
        IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_drop_down)),
      ],
    );
  }
}
