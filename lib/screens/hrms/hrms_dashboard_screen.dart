import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/attendance/attendance_bloc.dart';
import 'package:saasify/bloc/initialise/initialise_bloc.dart';
import 'package:saasify/bloc/initialise/initialise_events.dart';
import 'package:saasify/bloc/initialise/initialise_states.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/configs/dashboard_route.dart';
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
                        const ModuleHeading(label: 'Quick Updates'),
                        const SizedBox(height: spacingSmall),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height:
                                    MediaQuery.sizeOf(context).height * 0.25,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.lighterBlack),
                                    borderRadius:
                                        BorderRadius.circular(kCardRadius)),
                                child: const Padding(
                                  padding: EdgeInsets.all(spacingSmall),
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: []),
                                ),
                              ),
                            ),
                            const SizedBox(width: spacingStandard),
                            Expanded(
                              child: Container(
                                height:
                                    MediaQuery.sizeOf(context).height * 0.25,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.lighterBlack),
                                    borderRadius:
                                        BorderRadius.circular(kCardRadius)),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: spacingHuge),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const ModuleHeading(label: 'Task Boards'),
                            Text('View all',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelTextStyle
                                    .copyWith(
                                        fontWeight: FontWeight.w800,
                                        color: AppColors.orange)),
                          ],
                        ),
                        const SizedBox(height: spacingLarger),
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
                          itemCount: isMobile
                              ? 2
                              : (state.initialiseAppModel.data!
                                          .accessibleFeatures!.length <=
                                      5)
                                  ? state.initialiseAppModel.data!
                                      .accessibleFeatures!.length
                                  : 5,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                    color: AppColors.lightestYellow,
                                    border: Border.all(
                                        color: AppColors.lighterBlack),
                                    borderRadius:
                                        BorderRadius.circular(kCardRadius)),
                                child: Padding(
                                  padding: EdgeInsets.all(
                                      isMobile ? spacingSmall : spacingMedium),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Submit Documents',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelTextStyle
                                              .copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.darkBlue)),
                                      const SizedBox(height: spacingStandard),
                                      const Text(
                                          'Upload and submit F12 & 1QC Form',
                                          maxLines: 1,
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis),
                                      const Text('28/12/2024'),
                                      const Text('High Priority')
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: spacingHuge),
                        const ModuleHeading(label: 'Features'),
                        const SizedBox(height: spacingStandard),
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
                            return InkWell(
                              onTap: () {
                                DashboardRouting(
                                        featureKey: state
                                            .initialiseAppModel
                                            .data!
                                            .accessibleFeatures![index]
                                            .featureKey!,
                                        context: context)
                                    .navigateTo();
                              },
                              child: ValueCard(
                                  cardHeading: state.initialiseAppModel.data!
                                      .accessibleFeatures![index].title
                                      .toString(),
                                  value: state.initialiseAppModel.data!
                                      .accessibleFeatures![index].value
                                      .toString(),
                                  iconData: state.initialiseAppModel.data!
                                      .accessibleFeatures![index].title
                                      .toString()),
                            );
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
