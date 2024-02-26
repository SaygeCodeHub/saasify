import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/screens/hrms/widgets/build_date.dart';

Widget buildEmptyAnnouncements(context) {
  return Center(
    child: Text('No Announcements',
        style: Theme.of(context)
            .textTheme
            .labelTextStyle
            .copyWith(fontWeight: FontWeight.w800, color: AppColors.orange)),
  );
}

Widget buildAnnouncementItem(context, date, description) {
  return Padding(
    padding: const EdgeInsets.all(spacingSmall),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 78,
          child: buildDate(date, context),
        ),
        const Text(' : '),
        Expanded(
          child: Text(description, maxLines: 2),
        )
      ],
    ),
  );
}