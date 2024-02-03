import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
class LeavesTableHeading extends StatelessWidget {
  final String title;
  const LeavesTableHeading({
    super.key, required this.title
  });


  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: const TextStyle(
            fontSize: spacingLarge, fontWeight: FontWeight.bold));
  }
}