import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/leaves/leave_events.dart';
import 'package:saasify/bloc/leaves/leave_states.dart';
import 'package:saasify/bloc/leaves/leaves_bloc.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/screens/hrms/leaves/getMyLeaves/my_leaves_mobile_screen.dart';
import 'package:saasify/screens/hrms/leaves/getMyLeaves/my_leaves_web_screen.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/alertDialogs/error_alert_dialog.dart';
import 'package:saasify/widgets/layoutWidgets/responsive_layout.dart';
import 'package:saasify/widgets/layoutWidgets/screen_skeleton.dart';
import 'package:saasify/widgets/text/module_heading.dart';

import '../../../../utils/progress_bar.dart';
import '../../../../widgets/alertDialogs/success_alert_dialog.dart';

class MyLeavesScreen extends StatelessWidget {
  static const routeName = 'GetMyLeavesScreen';

  const MyLeavesScreen({super.key});

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
                            Row(children: [
                              isMobile
                                  ? const SizedBox.shrink()
                                  : const BackButton(),
                              const SizedBox(width: spacingXMedium),
                              const ModuleHeading(
                                  label: StringConstants.kMyLeaves)
                            ])
                          ])),
                  BlocConsumer<LeavesBloc, LeaveStates>(
                      listener: (context, state) {
                    if (state is LeavesFetchingFailed) {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return ErrorAlertDialog(
                                description: state.errorMessage.toString());
                          });
                    }
                    if (state is UpdatingLeaveStatus) {
                      ProgressBar.show(context);
                    }
                    if (state is LeaveStatusUpdated) {
                      ProgressBar.dismiss(context);
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return SuccessAlertDialog(
                                description:
                                    state.updateLeaveStatusModel.message,
                                onPressed: () {
                                  Navigator.pop(context);
                                  context
                                      .read<LeavesBloc>()
                                      .add(GetAllLeaves());
                                });
                          });
                    }
                    if (state is LeaveStatusUpdateFailed) {
                      ProgressBar.dismiss(context);
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return ErrorAlertDialog(
                                description: state.errorMessage,
                                onPressed: () {
                                  Navigator.pop(context);
                                  context
                                      .read<LeavesBloc>()
                                      .add(GetAllLeaves());
                                });
                          });
                    }
                  }, builder: (context, state) {
                    if (state is FetchingAllLeaves) {
                      return const Expanded(
                          child: Center(child: CircularProgressIndicator()));
                    } else if (state is LeavesFetched) {
                      return Expanded(
                        child: state.getAllLeavesModel.data.myLeaves.isEmpty
                            ? Center(
                                child: Text(state.getAllLeavesModel.message,
                                    style: Theme.of(context)
                                        .textTheme
                                        .disabledTextStyle))
                            : ResponsiveLayout(
                                mobileBody: MyLeavesMobileScreen(
                                    myLeaves:
                                        state.getAllLeavesModel.data.myLeaves),
                                desktopBody: MyLeavesWebScreen(
                                    myLeaves:
                                        state.getAllLeavesModel.data.myLeaves)),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  })
                ]));
  }
}
