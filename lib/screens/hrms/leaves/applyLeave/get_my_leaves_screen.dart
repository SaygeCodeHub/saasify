import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/leaves/leave_state.dart';
import 'package:saasify/bloc/leaves/leaves_bloc.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/screens/hrms/leaves/applyLeave/get_my_leaves_mobile_screen.dart';
import 'package:saasify/screens/hrms/leaves/applyLeave/get_my_leaves_web_screen.dart';
import 'package:saasify/widgets/alertDialogs/error_alert_dialog.dart';
import 'package:saasify/widgets/layoutWidgets/responsive_layout.dart';
import 'package:saasify/widgets/layoutWidgets/screen_skeleton.dart';
import 'package:saasify/widgets/text/module_heading.dart';

class GetMyLeavesScreen extends StatelessWidget {
  static const routeName = 'GetMyLeavesScreen';

  const GetMyLeavesScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                        // Padding(
                        //   padding: const EdgeInsets.only(right: spacingLarger),
                        //   child: (isMobile)
                        //       ? InkWell(
                        //       onTap: () {},
                        //       child: const Icon(Icons.filter_alt_outlined))
                        //       : Row(children: [
                        //     CustomDropDown(
                        //         items: const ["Last 30 Days", "Last Week"],
                        //         defaultValue: "Last 30 Days",
                        //         icon: Icons.store,
                        //         onChanged: (value) {}),
                        //   ]),
                        // ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: BlocConsumer<LeavesBloc, LeaveStates>(
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
                    if (state is FetchingMyLeaves) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is MyLeavesFetched) {
                      return const ResponsiveLayout(
                        mobileBody: GetMyLeavesMobileScreen(),
                        desktopBody: GetMyLeavesWebScreen(),
                      );
                    } else if (state is MyLeavesNotFetched) {
                      return const Center(child: Text("Error Loading Data"));
                    } else {
                      return const SizedBox.shrink();
                    }
                  }))
                ]));
  }
}
