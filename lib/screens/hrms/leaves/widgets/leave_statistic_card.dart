import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/data/models/leaves/load_apply_leave_screen_model.dart';

class LeaveStatisticsCard extends StatelessWidget {
  final IconData iconData;
  final String title;
  final String trailingData;
  final ApplyLeaveData applyLeaveData;

  const LeaveStatisticsCard(
      {super.key,
      required this.applyLeaveData,
      required this.iconData,
      required this.title,
      required this.trailingData});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
            padding: const EdgeInsets.all(spacingSmallest),
            child: ListTile(
                leading: Icon(iconData, color: AppColors.orange),
                title: Text(title),
                trailing: Text(trailingData))));
  }
}
