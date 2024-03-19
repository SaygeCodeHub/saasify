import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/details/fetch_details_model.dart';

class CircleAvatarWidget extends StatelessWidget {
  final Section sections;

  const CircleAvatarWidget({super.key, required this.sections});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const CircleAvatar(
              maxRadius: kCircleAvatarRadius,
              backgroundColor: AppColors.black,
              backgroundImage: AssetImage('assets/human.gif'),
            ),
            const SizedBox(width: spacingXMedium),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(sections.title,
                    style: Theme.of(context).textTheme.titleTextStyle),
                const SizedBox(height: spacingSmallest),
                Text(sections.subtitle,
                    style: Theme.of(context).textTheme.subtitleTextStyle)
              ],
            )
          ],
        ),
        const SizedBox(height: spacingMedium)
      ],
    );
  }
}
