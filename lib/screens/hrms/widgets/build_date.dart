import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';

Widget buildDate(date, context,
    {bool? showDateIcon = false, bool? orangeColor = true}) {
  DateTime dateTime = DateTime.parse(date);
  String formattedDate = '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  return Row(
    children: [
      (showDateIcon!) ? const Icon(Icons.date_range) : const SizedBox.shrink(),
      const SizedBox(width: spacingXXSmall),
      Text(formattedDate,
          style: (orangeColor!)
              ? Theme.of(context)
                  .textTheme
                  .cardMobileHeadingTextStyle
                  .copyWith(color: AppColors.orange)
              : Theme.of(context).textTheme.cardMobileHeadingLarge)
    ],
  );
}
