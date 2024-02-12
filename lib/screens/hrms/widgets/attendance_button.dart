import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/attendance/attendance_bloc.dart';
import 'package:saasify/bloc/attendance/attendance_event.dart';
import 'package:saasify/bloc/attendance/attendance_state.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/widgets/alertDialogs/error_alert_dialog.dart';
import 'package:saasify/widgets/buttons/primary_button.dart';

import '../../../utils/constants/string_constants.dart';

class AttendanceButton extends StatelessWidget {
  const AttendanceButton({super.key});

  @override
  Widget build(BuildContext context) {
    bool checkInTimeExists() {
      return (context.read<AttendanceBloc>().checkInTime.value != null);
    }

    bool checkOutTimeExists() {
      return (context.read<AttendanceBloc>().checkOutTime.value != null);
    }

    return BlocConsumer<AttendanceBloc, AttendanceStates>(
        listener: (BuildContext context, state) {
      if (state is ErrorMarkingAttendance) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return ErrorAlertDialog(description: state.message);
          },
        );
      }
    }, builder: (BuildContext context, state) {
      if (state is MarkingAttendance) {
        return const Center(
            child: SizedBox(
                width: 25, height: 25, child: CircularProgressIndicator()));
      } else {
        return (checkInTimeExists() && checkOutTimeExists())
            ? PrimaryButton(
                buttonWidth: 40,
                buttonHeight: 40,
                backgroundColor: AppColors.successGreen,
                onPressed: () {},
                buttonTitle: 'Done for the day!')
            : PrimaryButton(
                buttonWidth: 40,
                buttonHeight: 40,
                backgroundColor: (!checkInTimeExists())
                    ? AppColors.successGreen
                    : AppColors.errorRed,
                onPressed: () {
                  context.read<AttendanceBloc>().add(MarkAttendance());
                },
                buttonTitle: !checkInTimeExists()
                    ? StringConstants.kCheckIn
                    : StringConstants.kCheckOut);
      }
    });
  }
}
