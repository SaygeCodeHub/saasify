import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/initialise/initialise_bloc.dart';
import 'package:saasify/bloc/initialise/initialise_events.dart';
import 'package:saasify/bloc/initialise/initialise_states.dart';
import 'package:saasify/configs/app_route.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/screens/attendance/attendance_card.dart';
import 'package:saasify/screens/hrms/widgets/hrms_announcements_section.dart';
import 'package:saasify/widgets/layoutWidgets/screen_skeleton.dart';

class DashboardScreen extends StatefulWidget {
  static const routeName = 'DashboardScreen';

  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> with RouteAware {
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
                if (state is InitialisingAppFailed) {
                  return Center(
                      child: TextButton(
                          onPressed: () {
                            context
                                .read<InitialiseAppBloc>()
                                .add(InitialiseApp());
                          },
                          child: const Text('Retry')));
                }
                if (state is AppInitialised) {
                  return const SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(mainAxisSize: MainAxisSize.min, children: [
                            Expanded(child: AttendanceCard(isMobile: true))
                          ]),
                          SizedBox(height: spacingStandard),
                          HrmsAnnouncementsSection(isMobile: true),
                        ]),
                  );
                }
                return const SizedBox();
              },
            )));
  }
}
