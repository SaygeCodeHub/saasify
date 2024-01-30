import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/leaves/leaves_bloc.dart';
import 'package:saasify/bloc/leaves/leave_event.dart';
import 'package:saasify/bloc/leaves/leave_state.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/screens/hrms/leaves/applyLeave/apply_leave_mobile_screen.dart';
import 'package:saasify/screens/hrms/leaves/applyLeave/apply_leave_web_screen.dart';
import 'package:saasify/widgets/alertDialogs/error_alert_dialog.dart';
import 'package:saasify/widgets/layoutWidgets/responsive_layout.dart';
import 'package:saasify/widgets/layoutWidgets/screen_skeleton.dart';
import 'package:saasify/widgets/text/module_heading.dart';

class ApplyLeaveScreen extends StatelessWidget {
  static const routeName = 'ApplyLeaveScreen';
  final bool? isDetailScreen;

  const ApplyLeaveScreen({super.key, this.isDetailScreen = false});

  @override
  Widget build(BuildContext context) {
    context.read<LeavesBloc>().add(LoadApplyLeaveScreen());
    return Scaffold(
      body: ScreenSkeleton(
        childScreenBuilder: (bool isMobile) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: spacingMedium),
            Padding(
              padding: const EdgeInsets.only(left: spacingMedium),
              child: Row(
                children: [
                  isMobile ? const SizedBox.shrink() : const BackButton(),
                  const SizedBox(width: spacingXMedium),
                  const ModuleHeading(label: 'Apply Leave'),
                ],
              ),
            ),
            Expanded(
              child: BlocConsumer<LeavesBloc, LeaveStates>(
                listener: (context, state) {
                  if (state is ErrorLoadingApplyLeaveScreen) {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return ErrorAlertDialog(
                              description: 'Something went wrong!',
                              onPressed: () {
                                Navigator.popUntil(
                                    context, (route) => route.isFirst);
                              });
                        });
                  }
                },
                builder: (context, state) {
                  if (state is LoadingApplyLeaveScreen) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ApplyLeaveScreenLoaded) {
                    return ResponsiveLayout(
                        mobileBody: ApplyLeaveMobileScreen(
                            isDetailScreen: false,
                            applyLeaveData:
                                state.loadApplyLeaveScreenModel.data),
                        desktopBody: ApplyLeaveWebScreen(
                            isDetailScreen: false,
                            applyLeaveData:
                                state.loadApplyLeaveScreenModel.data));
                  } else if (state is ErrorLoadingApplyLeaveScreen) {
                    return const Center(child: Text("Error Loading Data"));
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
