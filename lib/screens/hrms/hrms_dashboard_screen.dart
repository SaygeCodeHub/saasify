import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/initialise/initialise_bloc.dart';
import 'package:saasify/bloc/initialise/initialise_events.dart';
import 'package:saasify/bloc/initialise/initialise_states.dart';
import 'package:saasify/configs/app_route.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/screens/hrms/widgets/hrms_announcements_section.dart';
import 'package:saasify/screens/hrms/widgets/hrms_attendance_section.dart';
import 'package:saasify/widgets/layoutWidgets/screen_skeleton.dart';
import 'widgets/hrms_features_section.dart';
import 'widgets/hrms_tasks_section.dart';

class HRMSDashboardScreen extends StatefulWidget {
  static const routeName = 'HRMSDashboardScreen';

  const HRMSDashboardScreen({super.key});

  @override
  State<HRMSDashboardScreen> createState() => _HRMSDashboardScreenState();
}

class _HRMSDashboardScreenState extends State<HRMSDashboardScreen>
    with RouteAware {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      routeObserver.subscribe(this, ModalRoute.of(context)!);
    });
    super.initState();
  }

  @override
  void didPopNext() {
    context.read<InitialiseAppBloc>().add(InitialiseApp());
  }

  @override
  Widget build(BuildContext context) {
    return ScreenSkeleton(
        isHome: true,
        childScreenBuilder: (isMobile) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacingLarge),
            child: BlocBuilder<InitialiseAppBloc, InitialiseAppStates>(
              builder: (context, state) {
                if (state is InitialisingApp) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is AppInitialised) {
                  return SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: spacingStandard),
                          (isMobile)
                              ? const Column(children: [
                                  HrmsAttendanceSection(isMobile: false),
                                  SizedBox(height: spacingHuge),
                                  HrmsAnnouncementsSection(isMobile: false)
                                ])
                              : const Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                      HrmsAttendanceSection(isMobile: true),
                                      SizedBox(width: spacingStandard),
                                      Expanded(
                                          child: HrmsAnnouncementsSection(
                                              isMobile: true))
                                    ]),
                          const SizedBox(height: spacingHuge),
                          HrmsTasksSection(isMobile: isMobile),
                          const SizedBox(height: spacingHuge),
                          HrmsFeaturesSection(isMobile: isMobile),
                          const SizedBox(height: spacingLarge)
                        ]),
                  );
                }
                return Center(
                    child: TextButton(
                        onPressed: () {
                          context
                              .read<InitialiseAppBloc>()
                              .add(InitialiseApp());
                        },
                        child: const Text('Retry')));
              },
            )));
  }
}
