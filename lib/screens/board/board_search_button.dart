import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_spacing.dart';

class BoardSearchButton extends StatelessWidget {
  const BoardSearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(KBoardTilePadding),
      child: Container(
        width: kBoardSearchBtnWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(KBoardTilePadding),
          border: Border.all(color: AppColors.black),
        ),
        child: Row(
          children: [
            const Expanded(
              child: Padding(
                padding: EdgeInsets.all(spacingXSmall),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(spacingSmall),
                    hintStyle: TextStyle(color: AppColors.darkGrey),
                  ),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
