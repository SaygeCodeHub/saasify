import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';

import '../configs/app_spacing.dart';
import '../utils/date_time_formatters.dart';

class TodaysDate extends StatelessWidget {
  const TodaysDate({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.calendar_today_outlined, size: 18),
        const SizedBox(width: spacingSmall),
        Text(formatDate(DateTime.now()),
            maxLines: 1,
            style: Theme.of(context)
                .textTheme
                .subDetailTextStyle
                .copyWith(fontWeight: FontWeight.w700))
      ],
    );
  }
}
