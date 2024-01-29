import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/leaves/load_apply_leave_bloc.dart';
import 'package:saasify/screens/hrms/leaves/widgets/apply_and_leave_detail_mobile_screen.dart';
import 'package:saasify/screens/hrms/leaves/widgets/apply_and_leave_detail_web_screen.dart';

import '../../../bloc/leaves/load_apply_leave_event.dart';
import '../../../bloc/leaves/load_apply_leave_state.dart';
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
    context.read<LoadApplyLeaveBloc>().add(LoadApplyLeave());
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
              child: BlocBuilder<LoadApplyLeaveBloc, LoadApplyLeaveState>(
                builder: (context, state) {
                  if (state is LoadingApplyLeave) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is LoadedApplyLeave) {
                    return ResponsiveLayout(
                        mobileBody: ApplyAndLeaveDetailMobileScreen(
                            isDetailScreen: false, applyLeaveData: state.loadApplyLeaveModel.data),
                        desktopBody: ApplyAndLeaveDetailWebScreen(
                          isDetailScreen: false, applyLeaveData: state.loadApplyLeaveModel.data));
                  } else if (state is ErrorLoadingApplyLeave){
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
