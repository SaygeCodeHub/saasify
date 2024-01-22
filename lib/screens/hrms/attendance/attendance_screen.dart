import 'dart:developer';

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
            log(state.toString());
            if (state is CheckingIn || state is CheckingOut) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ErrorCheckingIn) {
              return Center(child: Text(state.message));
            } else if (state is CheckedIn) {
              return ElevatedButton(
                  onPressed: () {
                    context.read<AttendanceBloc>().add(CheckOut());
                  },
                  child: const Text('Check Out'));
            } else if (state is CheckedOut) {
              return const Center(child: Text("Day Completed"));
            } else {
              return ElevatedButton(
                  onPressed: () {
                    context.read<AttendanceBloc>().add(CheckIn());
                  },
                  child: const Text('Check In'));
            }
          }),
          desktopBody: const SizedBox());
    });
  }
}
