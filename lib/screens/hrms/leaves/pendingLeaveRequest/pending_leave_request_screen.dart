import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/leaves/leave_event.dart';
import 'package:saasify/bloc/leaves/leave_state.dart';
import 'package:saasify/bloc/leaves/leaves_bloc.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/screens/hrms/leaves/pendingLeaveRequest/pending_leave_request_mobile_screen.dart';
import 'package:saasify/screens/hrms/leaves/pendingLeaveRequest/pending_leave_request_web_screen.dart';
import 'package:saasify/utils/progress_bar.dart';
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
                      } else if (state is UpdatingLeaveStatus) {
                        ProgressBar.show(context);
                      } else if (state is LeaveStatusUpdated) {
                        ProgressBar.dismiss(context);
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                  icon: const Align(
                                      alignment: Alignment.topCenter,
                                      child: Icon(Icons.done_all_rounded)),
                                  content: SizedBox(
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.2,
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                    child: const Card(
                                        child: Center(
                                      child: Text(
                                          "Successfully updated status \nThank You.",
                                          textAlign: TextAlign.center),
                                    )),
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          context
                                              .read<LeavesBloc>()
                                              .add(GetAllLeaves());
                                        },
                                        child: const Text("OK"))
                                  ]);
                            });
                      } else if (state is LeaveStatusUpdateFailed) {
                        ProgressBar.dismiss(context);
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                  icon: const Align(
                                      alignment: Alignment.topCenter,
                                      child: Icon(Icons.sms_failed_rounded)),
                                  content: SizedBox(
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.2,
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                    child: const Card(
                                        child: Center(
                                      child: Text(
                                        "Failed to update status \nPlease Try Again.",
                                        textAlign: TextAlign.center,
                                      ),
                                    )),
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("OK"))
                                  ]);
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
                                  pendingLeaves: state
                                      .getAllLeavesModel.data.pendingLeaves)),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    }),
              ],
            ));
  }
}
