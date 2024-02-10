import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/attendance/attendance_bloc.dart';
import 'package:saasify/bloc/initialise/initialise_bloc.dart';
import 'package:saasify/bloc/initialise/initialise_events.dart';
import 'package:saasify/bloc/initialise/initialise_states.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/screens/hrms/widgets/hrms_announcements_section.dart';
import 'package:saasify/screens/hrms/widgets/hrms_attendance_section.dart';
import 'package:saasify/widgets/alertDialogs/error_alert_dialog.dart';
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
            child: BlocConsumer<InitialiseAppBloc, InitialiseAppStates>(
                listener: (context, state) {
              if (state is InitialisingAppFailed) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return ErrorAlertDialog(
                        description: state.errorMessage.toString());
                  },
                );
              }
              if (state is AppInitialised) {
                context.read<AttendanceBloc>().isGeoFencingEnabled =
                    state.isGeoFencing;
              }
            }, builder: (context, state) {
              if (state is InitialisingApp) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is AppInitialised) {
                return SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: spacingStandard),
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(child: HrmsAnnouncementsSection()),
                            SizedBox(width: spacingStandard),
                            Expanded(child: HrmsAttendanceSection())
                          ],
                        ),
                        const SizedBox(height: spacingHuge),
                        HrmsTasksSection(isMobile: isMobile),
                        const SizedBox(height: spacingHuge),
                        HrmsFeaturesSection(
                            isMobile: isMobile,
                            initialiseAppModel: state.initialiseAppModel),
                        const SizedBox(height: spacingLarge),
                      ]),
                );
              } else {
                return const SizedBox.shrink();
              }
            })));
  }
}
