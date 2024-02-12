import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/initialise/initialise_bloc.dart';
import 'package:saasify/bloc/initialise/initialise_events.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/screens/hrms/widgets/hrms_announcements_section.dart';
import 'package:saasify/screens/hrms/widgets/hrms_attendance_section.dart';
import 'package:saasify/widgets/layoutWidgets/screen_skeleton.dart';
import 'widgets/hrms_features_section.dart';
import 'widgets/hrms_tasks_section.dart';

class HRMSDashboardScreen extends StatelessWidget {
  static const routeName = 'HRMSDashboardScreen';

  const HRMSDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<InitialiseAppBloc>().add(InitialiseApp());
    return ScreenSkeleton(
        isHome: true,
        childScreenBuilder: (isMobile) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacingLarge),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: spacingStandard),
                    (isMobile)
                        ? Column(
                            children: [
                              HrmsAttendanceSection(isMobile: isMobile),
                              const SizedBox(height: spacingHuge),
                              const HrmsAnnouncementsSection()
                            ],
                          )
                        : const Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              HrmsAttendanceSection(isMobile: true),
                              SizedBox(width: spacingStandard),
                              Expanded(child: HrmsAnnouncementsSection()),
                            ],
                          ),
                    const SizedBox(height: spacingHuge),
                    HrmsTasksSection(isMobile: isMobile),
                    const SizedBox(height: spacingHuge),
                    HrmsFeaturesSection(isMobile: isMobile),
                    const SizedBox(height: spacingLarge),
                  ]),
            )));
  }
}
