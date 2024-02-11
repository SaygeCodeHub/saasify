import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';

class LeaveDetails extends StatelessWidget {
  final String title;
  final String leaveData;

  const LeaveDetails({
    super.key,
    required this.leaveData,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Title(
        color: AppColors.black,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text("$title : "), Text(leaveData, maxLines: 1)]));
  }
}
