import 'package:flutter/material.dart';
import 'package:saasify/widgets/layoutWidgets/screen_skeleton.dart';

class ShiftManagementScreen extends StatelessWidget {
  static const routeName = 'ShiftManagementScreen';

  const ShiftManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenSkeleton(childScreenBuilder: (isMobile) {
      return const SingleChildScrollView();
    });
  }
}
