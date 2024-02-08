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
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("$title : ",
              style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(leaveData, maxLines: 5)
        ]));
  }
}

class CommentDetails extends StatelessWidget {
  final String title;
  final String commentData;

  const CommentDetails({
    super.key,
    required this.commentData,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Title(
        color: AppColors.black,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("$title : ",
              style: const TextStyle(fontWeight: FontWeight.bold)),
          Container(
              decoration:
                  BoxDecoration(border: Border.all(color: AppColors.black)),
              child: Text(commentData, maxLines: 5))
        ]));
  }
}
