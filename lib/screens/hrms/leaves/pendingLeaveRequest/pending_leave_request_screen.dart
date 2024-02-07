import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/leaves/leave_event.dart';
import 'package:saasify/bloc/leaves/leave_state.dart';
import 'package:saasify/bloc/leaves/leaves_bloc.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/screens/hrms/leaves/pendingLeaveRequest/pending_leave_request_mobile_screen.dart';
import 'package:saasify/screens/hrms/leaves/pendingLeaveRequest/pending_leave_request_web_screen.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/utils/progress_bar.dart';
import 'package:saasify/widgets/alertDialogs/error_alert_dialog.dart';
import 'package:saasify/widgets/alertDialogs/success_alert_dialog.dart';
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
                          const ModuleHeading(
                              label: StringConstants.kPendingLeaveRequests),
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
                      } else if (state is UpdatingLeaveStatus) {
                        ProgressBar.show(context);
                      } else if (state is LeaveStatusUpdated) {
                        ProgressBar.dismiss(context);
                        showDialog(
                            context: context,
                            builder: (context) {
                              return SuccessAlertDialog(
                                  description: state
                                      .updateLeaveStatusModel.message
                                      .toString(),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    context
                                        .read<LeavesBloc>()
                                        .add(GetAllLeaves());
                                  });
                            });
                      } else if (state is LeaveStatusUpdateFailed) {
                        ProgressBar.dismiss(context);
                        showDialog(
                            context: context,
                            builder: (context) {
                              return ErrorAlertDialog(
                                  description: state.errorMessage.toString(),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  });
                            });
                      }
                    },
                    buildWhen: (previousState, currentState) =>
                        currentState is FetchingAllLeaves ||
                        currentState is LeavesFetched ||
                        currentState is LeavesFetchingFailed,
                    builder: (context, state) {
                      if (state is FetchingAllLeaves) {
                        return const Expanded(
                            child: Center(child: CircularProgressIndicator()));
                      } else if (state is LeavesFetched) {
                        return Expanded(
                            child: ResponsiveLayout(
                                mobileBody: PendingLeaveRequestsMobileScreen(
                                    pendingLeaves: state
                                        .getAllLeavesModel.data.pendingLeaves),
                                desktopBody: PendingLeaveRequestsWebScreen(
                                    pendingLeaves: state.getAllLeavesModel.data
                                        .pendingLeaves)));
                      } else {
                        return const SizedBox.shrink();
                      }
                    }),
              ],
            ));
  }
}
