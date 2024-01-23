import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/attendance/attendance_bloc.dart';
import 'package:saasify/bloc/attendance/attendance_event.dart';
import 'package:saasify/bloc/attendance/attendance_state.dart';
import 'package:saasify/widgets/layoutWidgets/responsive_layout.dart';
import 'package:saasify/widgets/layoutWidgets/screen_skeleton.dart';

class AttendanceScreen extends StatelessWidget {
  static const routeName = 'AttendanceScreen';
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenSkeleton(childScreenBuilder: (isMobile) {
      return ResponsiveLayout(
          mobileBody: BlocBuilder<AttendanceBloc, AttendanceStates>(
              builder: (BuildContext context, state) {
            if (state is MarkingAttendance) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ErrorMarkingAttendance) {
              return Center(child: Text(state.message));
            } else if (state is MarkedAttendance) {
              return ElevatedButton(
                  onPressed: () {
                    context.read<AttendanceBloc>().add(MarkAttendance());
                  },
                  child: const Text('Check Out'));
            } else {
              return ElevatedButton(
                  onPressed: () {
                    context.read<AttendanceBloc>().add(MarkAttendance());
                  },
                  child: const Text('Check In'));
            }
          }),
          desktopBody: Center(
              child: Text(
            'Only Mobile is supported',
            style: Theme.of(context).textTheme.headlineMedium,
          )));
    });
  }
}
