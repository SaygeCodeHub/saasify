import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/leaves/leave_event.dart';
import 'package:saasify/bloc/leaves/leave_state.dart';
import 'package:saasify/bloc/leaves/leaves_bloc.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/screens/hrms/leaves/pendingLeaveRequest/pending_leave_request_mobile_screen.dart';
import 'package:saasify/screens/hrms/leaves/pendingLeaveRequest/pending_leave_request_web_screen.dart';
import 'package:saasify/widgets/alertDialogs/error_alert_dialog.dart';
import 'package:saasify/widgets/layoutWidgets/responsive_layout.dart';
import 'package:saasify/widgets/layoutWidgets/screen_skeleton.dart';
import 'package:saasify/widgets/text/module_heading.dart';

class PendingLeaveRequestScreen extends StatelessWidget {
  static const routeName = 'PendingLeaveRequestScreen';

  const PendingLeaveRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<LeavesBloc>().add(GetAllLeaves());
    return ScreenSkeleton(
        childScreenBuilder: (isMobile) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: spacingMedium),
                Padding(
                  padding: const EdgeInsets.only(left: spacingMedium),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          isMobile
                              ? const SizedBox.shrink()
                              : const BackButton(),
                          const SizedBox(width: spacingXMedium),
                          const ModuleHeading(label: 'Leave Requests'),
                        ],
                      ),
                    ],
                  ),
                ),
                BlocConsumer<LeavesBloc, LeaveStates>(
                    listener: (context, state) {
                  if (state is LeavesFetchingFailed) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return ErrorAlertDialog(
                            description: state.errorMessage.toString());
                      },
                    );
                  }
                }, builder: (context, state) {
                  if (state is FetchingAllLeaves) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is LeavesFetched) {
                    return Expanded(
                      child: ResponsiveLayout(
                          mobileBody: const PendingLeaveRequestsMobile(),
                          desktopBody: PendingLeaveRequestsWeb(
                              myLeaves: state.getAllLeavesModel.data.myLeaves)),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                }),
              ],
            ));
  }
}
