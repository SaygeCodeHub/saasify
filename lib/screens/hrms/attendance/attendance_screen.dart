import 'package:flutter/material.dart';
import 'package:saasify/widgets/layoutWidgets/responsive_layout.dart';
import 'package:saasify/widgets/layoutWidgets/screen_skeleton.dart';

class AttendanceScreen extends StatelessWidget {
  static const routeName = 'AttendanceScreen';
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenSkeleton(childScreenBuilder: (isMobile) {
      return ResponsiveLayout(
          mobileBody: Column(
            children: [
              ElevatedButton(onPressed: (){}, child: Text('Mark Attendance')),
            ],
          ),
          desktopBody: const SizedBox());
    });
  }
}

