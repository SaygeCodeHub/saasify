import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/widgets/generalWidgets/status_chip.dart';

class TableAvatar extends DataCell {
  TableAvatar({String? avatarUrl})
      : super(
            Center(
              child: CircleAvatar(
                backgroundImage:
                    (avatarUrl != null) ? NetworkImage(avatarUrl) : null,
                backgroundColor: AppColors.black,
              ),
            ),
            showEditIcon: false);
}

class TableText extends DataCell {
  TableText({required String text})
      : super(Text(text,
            maxLines: 1,
            overflow: TextOverflow.fade,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)));
}

class TableStatusChips extends DataCell {
  TableStatusChips({required String status, required Color color})
      : super(StatusChip(text: status, color: color));
}
