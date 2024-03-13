import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';

class CircleAvatarWidget extends StatelessWidget {
  const CircleAvatarWidget({super.key});

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
                Text('Rucha Wajpe',
                    style: Theme.of(context).textTheme.titleTextStyle),
                const SizedBox(height: spacingSmallest),
                Text('Flutter Developer',
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
