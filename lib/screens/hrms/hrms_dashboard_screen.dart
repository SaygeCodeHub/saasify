import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/attendance/attendance_bloc.dart';
import 'package:saasify/bloc/attendance/attendance_event.dart';
import 'package:saasify/caches/cache.dart';
import 'package:saasify/bloc/initialise/initialise_bloc.dart';
import 'package:saasify/bloc/initialise/initialise_events.dart';
import 'package:saasify/bloc/initialise/initialise_states.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/screens/hrms/attendance/attendance_card.dart';
import 'package:saasify/widgets/alertDialogs/error_alert_dialog.dart';
import 'package:saasify/widgets/layoutWidgets/screen_skeleton.dart';
import 'package:saasify/widgets/generalWidgets/value_card.dart';
import 'package:saasify/widgets/text/module_heading.dart';

class HRMSDashboardScreen extends StatelessWidget {
  static const routeName = 'HRMS';

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
                        FutureBuilder<List<String>?>(
                          future: getIt<Cache>().getDesignations(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              context
                                  .read<AttendanceBloc>()
                                  .add(FetchAttendance());
                              return snapshot.data!.contains('0')
                                  ? const SizedBox.shrink()
                                  : const AttendanceCard();
                            } else {
                              return const SizedBox.shrink();
                            }
                          },
                        ),
                        const SizedBox(height: spacingStandard),
                        const ModuleHeading(label: 'Features'),
                        const SizedBox(height: spacingSmall),
                        GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: isMobile ? 2 : 5,
                                  mainAxisSpacing: 8.0,
                                  crossAxisSpacing: 8.0,
                                  childAspectRatio: isMobile
                                      ? 1.4
                                      : 1.9 // Aspect ratio of each child
                                  ),
                          itemCount: state.initialiseAppModel.data!
                              .accessibleFeatures!.length,
                          itemBuilder: (context, index) {
                            return ValueCard(
                                cardHeading: state.initialiseAppModel.data!
                                    .accessibleFeatures![index].title
                                    .toString(),
                                value: state.initialiseAppModel.data!
                                    .accessibleFeatures![index].value
                                    .toString(),
                                iconData: state.initialiseAppModel.data!
                                    .accessibleFeatures![index].title
                                    .toString(),
                                onTap: () {});
                          },
                        ),
                        const SizedBox(height: spacingLarge),
                      ]),
                );
              } else {
                return const SizedBox.shrink();
              }
            })));
  }
}
