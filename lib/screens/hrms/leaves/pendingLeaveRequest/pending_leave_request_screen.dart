import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/leaves/leave_events.dart';
import 'package:saasify/bloc/leaves/leave_states.dart';
import 'package:saasify/bloc/leaves/leaves_bloc.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
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
                                description: state.errorMessage.toString(),
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                });
                          },
                        );
                      } else if (state is UpdatingLeaveStatus) {
                        ProgressBar.show(context);
                      } else if (state is LeaveStatusUpdated) {
                        ProgressBar.dismiss(context);
                        context.read<LeavesBloc>().add(GetAllLeaves());
                        showDialog(
                            context: context,
                            builder: (context) {
                              return SuccessAlertDialog(
                                  description: state
                                      .updateLeaveStatusModel.message
                                      .toString());
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
                        currentState is LeavesFetched,
                    builder: (context, state) {
                      if (state is FetchingAllLeaves) {
                        return const Expanded(
                            child: Center(child: CircularProgressIndicator()));
                      } else if (state is LeavesFetched) {
                        return Expanded(
                            child: state.getAllLeavesModel.data.pendingLeaves
                                    .isEmpty
                                ? Center(
                                    child: Text(StringConstants.kNoLeavesFound,
                                        style: Theme.of(context)
                                            .textTheme
                                            .disabledTextStyle))
                                : ResponsiveLayout(
                                    mobileBody:
                                        PendingLeaveRequestsMobileScreen(
                                            pendingLeaves: state
                                                .getAllLeavesModel
                                                .data
                                                .pendingLeaves),
                                    desktopBody: PendingLeaveRequestsWebScreen(
                                        pendingLeaves: state.getAllLeavesModel
                                            .data.pendingLeaves)));
                      } else {
                        return const SizedBox.shrink();
                      }
                    }),
              ],
            ));
  }
}
