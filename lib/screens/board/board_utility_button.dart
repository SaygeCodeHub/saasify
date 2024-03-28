import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_spacing.dart';

class BoardUtilityButton extends StatelessWidget {
  const BoardUtilityButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kBoardUtilityBtnw),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text(
            "GROUP BY",
            style: TextStyle(
              color: AppColors.darkGrey,
              fontSize: spacingSmall,
            ),
          ),
          const SizedBox(width: kBoardTilePadding),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.refresh),
            label: const Text('None'),
            style: ElevatedButton.styleFrom(
              foregroundColor: AppColors.black,
              backgroundColor: AppColors.grey.withOpacity(0.8),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
            ),
          ),
          const SizedBox(width: kBoardTilePadding),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.leaderboard),
            label: const Text('Insights'),
            style: ElevatedButton.styleFrom(
              foregroundColor: AppColors.black,
              backgroundColor: AppColors.grey.withOpacity(0.8),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
            ),
          ),
          const SizedBox(width: kBoardTilePadding),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.settings),
            label: const Text('View Settings'),
            style: ElevatedButton.styleFrom(
              foregroundColor: AppColors.black,
              backgroundColor: AppColors.grey.withOpacity(0.8),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
