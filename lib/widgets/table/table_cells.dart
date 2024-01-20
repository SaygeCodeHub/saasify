import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/new_app_theme.dart';
import 'package:saasify/widgets/generalWidgets/status_chips.dart';

class TableAvatar extends DataCell {
  TableAvatar({String? avatarUrl})
      : super(
            CircleAvatar(
              backgroundImage:
                  (avatarUrl != null) ? NetworkImage(avatarUrl) : null,
              backgroundColor: AppColors.black,
            ),
            showEditIcon: false);
}

class TableText extends DataCell {
  TableText(BuildContext context, {required String text})
      : super(Text(
          text,
          style: Theme.of(context).textTheme.labelTextStyle,
        ));
}

class TableStatusChips extends DataCell {
  const TableStatusChips()
      : super(const StatusChip(text: 'Active', color: AppColors.successGreen));
}
