import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/widgets/layoutWidgets/screen_skeleton.dart';
import 'package:timelines/timelines.dart';

class TimelineScreen extends StatelessWidget {
  const TimelineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenSkeleton(
      showDrawer: true,
      childScreenBuilder: (isMobile) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(spacingXXXHuge),
            child: Timeline.tileBuilder(
              shrinkWrap: true,
              builder: TimelineTileBuilder.fromStyle(
                contentsAlign: ContentsAlign.reverse,
                contentsBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Text('Timeline Event $index')),
                itemCount: 50,
              ),
            ),
          ),
        );
      },
    );
  }
}
