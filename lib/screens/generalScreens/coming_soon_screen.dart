import 'package:flutter/material.dart';
import 'package:saasify/widgets/layoutWidgets/screen_skeleton.dart';

class ComingSoonScreen extends StatelessWidget {
  static const routeName = 'ComingSoonScreen';
  const ComingSoonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ScreenSkeleton(
            childScreenBuilder: (isMobile) => Center(
                  child: Text('Coming Soon'),
                )));
  }
}
