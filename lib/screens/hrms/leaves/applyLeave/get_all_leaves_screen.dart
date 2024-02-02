import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/leaves/leave_event.dart';
import 'package:saasify/bloc/leaves/leave_state.dart';
import 'package:saasify/bloc/leaves/leaves_bloc.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/screens/hrms/leaves/applyLeave/get_all_leaves_mobile_screen.dart';
import 'package:saasify/screens/hrms/leaves/applyLeave/get_all_leaves_web_screen.dart';
import 'package:saasify/widgets/alertDialogs/error_alert_dialog.dart';
import 'package:saasify/widgets/layoutWidgets/responsive_layout.dart';
import 'package:saasify/widgets/layoutWidgets/screen_skeleton.dart';
import 'package:saasify/widgets/text/module_heading.dart';

class GetMyLeavesScreen extends StatelessWidget {
  static const routeName = 'GetMyLeavesScreen';

  const GetMyLeavesScreen({super.key});

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
                            const ModuleHeading(label: 'My Leaves'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  BlocConsumer<LeavesBloc, LeaveStates>(
                      listener: (context, state) {
                    if (state is MyLeavesNotFetched) {
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
                  }, builder: (context, state) {
                    log("state==========>$state");
                    if (state is FetchingMyLeaves) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is MyLeavesFetched) {
                      log("MyLeavesFetched==========>${state.getAllLeavesModel.data.toJson()}");
                      return Expanded(
                        child: ResponsiveLayout(
                            mobileBody: GetMyLeavesMobileScreen(
                                myLeavesData: state.getAllLeavesModel.data),
                            desktopBody: GetMyLeavesWebScreen(
                                myLeavesData: state.getAllLeavesModel.data)),
                      );
                    } else if (state is MyLeavesNotFetched) {
                      return const Center(child: Text("Error Loading Data"));
                    } else {
                      return const SizedBox.shrink();
                    }
                  })
                ]));
  }
}
