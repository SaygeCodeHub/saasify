import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/attendance/attendance_bloc.dart';
import 'package:saasify/bloc/attendance/attendance_event.dart';
import 'package:saasify/bloc/attendance/attendance_state.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/data/models/generalModels/value_card_model.dart';
import 'package:saasify/utils/modules.dart';
import 'package:saasify/widgets/layoutWidgets/screen_skeleton.dart';
import 'package:saasify/widgets/generalWidgets/value_card.dart';
import 'package:saasify/widgets/text/module_heading.dart';

class HRMSDashboardScreen extends StatelessWidget {
  static const routeName = 'HRMS';
  const HRMSDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isEmployee = true;
    List<ValueCardModel> modules = isEmployee ? employeeModules : ownerModules;
    return ScreenSkeleton(
        isHome: true,
        childScreenBuilder: (isMobile) => Padding(
            padding: const EdgeInsets.all(spacingLarge),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                        const ModuleHeading(label: 'HRMS'),
                        const SizedBox(height: spacingXSmall),
                        GridView.extent(
                            shrinkWrap: true,
                            maxCrossAxisExtent: 250.0,
                            childAspectRatio: isMobile ? 1.4 : 2,
                            mainAxisSpacing: 8.0,
                            crossAxisSpacing: 8.0,
                            children: modules.map((item) {
                              return ValueCard(
                                  cardHeading: item.cardHeading,
                                  value: item.value,
                                  iconPath: item.iconPath,
                                  onTap: () {
                                    item.onTap(context);
                                  });
                            }).toList()),
                      ])),
                ),
                isEmployee
                    ? BlocBuilder<AttendanceBloc, AttendanceStates>(
                        builder: (BuildContext context, state) {
                        if (state is MarkingAttendance) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (state is ErrorMarkingAttendance) {
                          return Center(child: Text(state.message));
                        } else if (state is MarkedAttendance) {
                          return ElevatedButton(
                              onPressed: () {
                                context
                                    .read<AttendanceBloc>()
                                    .add(MarkAttendance());
                              },
                              child: const Text('Check Out'));
                        } else {
                          return ElevatedButton(
                              onPressed: () {
                                context
                                    .read<AttendanceBloc>()
                                    .add(MarkAttendance());
                              },
                              child: const Text('Check In'));
                        }
                      })
                    : const SizedBox.shrink()
              ],
            )));
  }
}
