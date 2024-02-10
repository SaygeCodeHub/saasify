import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/timesheet/timesheet_bloc.dart';
import 'package:saasify/bloc/timesheet/timesheet_states.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/screens/hrms/timesheet/timesheet_mobile_screen.dart';
import 'package:saasify/screens/hrms/timesheet/timesheet_web_screen.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/alertDialogs/error_alert_dialog.dart';
import 'package:saasify/widgets/layoutWidgets/responsive_layout.dart';
import 'package:saasify/widgets/layoutWidgets/screen_skeleton.dart';
import 'package:saasify/widgets/text/module_heading.dart';

import '../../../bloc/timesheet/timesheet_events.dart';

class TimesheetScreen extends StatelessWidget {
  static const routeName = 'TimeSheetScreen';

  const TimesheetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<TimeSheetBloc>().add(GetTimesheet());
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
                                  label: StringConstants.kTimesheet),
                            ])
                          ])),
                  BlocConsumer<TimeSheetBloc, TimeSheetStates>(
                      listener: (context, state) {
                    if (state is FetchTimesheetError) {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return ErrorAlertDialog(description: state.message);
                          });
                    }
                  }, builder: (context, state) {
                    if (state is FetchingTimesheet) {
                      return const Expanded(
                          child: Center(child: CircularProgressIndicator()));
                    } else if (state is TimesheetFetched) {
                      return Expanded(
                        child: ResponsiveLayout(
                            mobileBody: TimesheetMobileScreen(
                                timesheetData: state.timesheetModel.data),
                            desktopBody: TimeSheetWebScreen(
                                timesheetData: state.timesheetModel.data)),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  })
                ]));
  }
}
