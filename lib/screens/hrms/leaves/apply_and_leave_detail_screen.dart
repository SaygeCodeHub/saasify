import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/leaves/leave_bloc.dart';
import 'package:saasify/screens/hrms/leaves/widgets/apply_and_leave_detail_mobile_screen.dart';
import 'package:saasify/screens/hrms/leaves/widgets/apply_and_leave_detail_web_screen.dart';

import '../../../bloc/leaves/leave_event.dart';
import '../../../bloc/leaves/leave_state.dart';
import '../../../configs/app_spacing.dart';
import '../../../widgets/layoutWidgets/responsive_layout.dart';
import '../../../widgets/layoutWidgets/screen_skeleton.dart';
import '../../../widgets/text/module_heading.dart';

class ApplyAndLeaveDetailScreen extends StatelessWidget {
  static const routeName = 'ApplyAndLeaveDetailScreen';
  final bool? isDetailScreen;

  const ApplyAndLeaveDetailScreen({super.key, this.isDetailScreen = false});

  @override
  Widget build(BuildContext context) {
    context.read<LeaveBloc>().add(LoadApplyLeaveScreen());
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
              child: BlocBuilder<LeaveBloc, LeaveState>(
                builder: (context, state) {
                  if (state is LoadingApplyLeaveScreen) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is LoadedApplyLeaveScreen) {
                    return ResponsiveLayout(
                        mobileBody: ApplyAndLeaveDetailMobileScreen(
                            isDetailScreen: false, applyLeaveData: state.loadApplyLeaveScreenModel.data),
                        desktopBody: ApplyAndLeaveDetailWebScreen(
                          isDetailScreen: false, applyLeaveData: state.loadApplyLeaveScreenModel.data));
                  } else if (state is ErrorLoadingApplyLeaveScreen){
                    return const Center(child: Text("No data Found"));
                  }else {
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
