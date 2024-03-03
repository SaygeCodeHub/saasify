import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saasify/bloc/attendance/attendance_bloc.dart';
import 'package:saasify/bloc/attendance/attendance_event.dart';
import 'package:saasify/bloc/attendance/attendance_state.dart';
import 'package:saasify/bloc/initialise/initialise_bloc.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/alertDialogs/error_alert_dialog.dart';
import 'package:saasify/widgets/buttons/primary_button.dart';

class MarkAttendanceButton extends StatelessWidget {
  const MarkAttendanceButton({super.key});

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
            : SizedBox(
                height: 100,
                width: 100,
                child: InkWell(
                  onTap: () {
                    context
                                .read<InitialiseAppBloc>()
                                .initialiseAppModel
                                ?.data
                                ?.announcements
                                ?.isNotEmpty ??
                            false
                        ? showDialog(
                            context: context,
                            builder: (context) {
                              return const AcknowledgementDialogue();
                            })
                        : context.read<AttendanceBloc>().add(MarkAttendance());
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80)),
                    color: (!checkInTimeExists())
                        ? AppColors.successGreen
                        : AppColors.errorRed,
                    elevation: 5,
                    child: Center(
                        child: Text(
                            !checkInTimeExists()
                                ? StringConstants.kCheckIn
                                : StringConstants.kCheckOut,
                            style: Theme.of(context)
                                .textTheme
                                .cardMobileValueTextStyle
                                .copyWith(color: AppColors.white))),
                  ),
                ));
      }
    });
  }
}

class AcknowledgementDialogue extends StatefulWidget {
  const AcknowledgementDialogue({
    super.key,
  });

  @override
  State<AcknowledgementDialogue> createState() =>
      _AcknowledgementDialogueState();
}

class _AcknowledgementDialogueState extends State<AcknowledgementDialogue> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: const Icon(FontAwesomeIcons.circleExclamation,
          color: AppColors.warningYellow, size: 30),
      title: const Text('Important!'),
      content: Row(
        children: [
          Checkbox(
              value: _isChecked,
              checkColor: AppColors.white,
              activeColor: AppColors.darkBlue,
              onChanged: (value) {
                setState(() {
                  _isChecked = value!;
                });
              }),
          const SizedBox(height: 10),
          const Expanded(
              child: Text(
                  'I acknowledge that I have read all the important announcements')),
        ],
      ),
      actionsPadding: const EdgeInsets.only(
          bottom: spacingXLarge, left: spacingXLarge, right: spacingXLarge),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        PrimaryButton(
            buttonWidth: kGeneralActionButtonWidth,
            onPressed: _isChecked
                ? () {
                    Navigator.pop(context);
                    context.read<AttendanceBloc>().add(MarkAttendance());
                  }
                : null,
            buttonTitle: 'Yes')
      ],
    );
  }
}
