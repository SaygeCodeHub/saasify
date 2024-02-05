import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:saasify/bloc/leaves/leaves_bloc.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/data/models/leaves/get_all_leaves_model.dart';
import 'package:saasify/screens/hrms/leaves/pendingLeaveRequest/approve_leave_button.dart';
import 'package:saasify/screens/hrms/leaves/pendingLeaveRequest/leave_details.dart';
import 'package:saasify/screens/hrms/leaves/pendingLeaveRequest/reject_leave_button.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/text/module_heading.dart';
import 'package:saasify/widgets/text/textfield_label_widget.dart';
class UpdateStatusPopup extends StatelessWidget {
  final bool isMobile;
  final MyLeaves pendingLeaves;
  final Function? onPressed;
  final GlobalKey<FormState> updateKey = GlobalKey<FormState>();

  UpdateStatusPopup(
      {super.key,
        required this.isMobile,
        required this.pendingLeaves,
        this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        icon: Align(
            alignment: Alignment.topRight,
            child: InkWell(
                onTap: () {
                  if (onPressed != null) {
                    onPressed!();
                  } else {
                    Navigator.pop(context);
                  }
                },
                child: const Icon(Icons.close))),
        title: const ModuleHeading(label: StringConstants.kUpdateLeaveStatus),
        content: SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.5,
            width: MediaQuery.sizeOf(context).width * 0.5,
            child: Card(
                child: Padding(
                    padding: const EdgeInsets.all(spacingMedium),
                    child: Form(
                      key: updateKey,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            LeaveDetails(
                              title: StringConstants.kApplicantName,
                              leaveData: pendingLeaves.name.toString(),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                LeaveDetails(
                                    title: StringConstants.kLeaveType,
                                    leaveData: pendingLeaves.leaveType)
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                LeaveDetails(
                                    title: StringConstants.kStartDate,
                                    leaveData: DateFormat("yyyy-MM-dd")
                                        .format(pendingLeaves.startDate)),
                                const SizedBox(width: spacingXXHuge),
                                LeaveDetails(
                                    title: StringConstants.kEndDate,
                                    leaveData: DateFormat("yyyy-MM-dd")
                                        .format(pendingLeaves.endDate)),
                              ],
                            ),
                            LeaveDetails(
                                title: StringConstants.kLeaveReason,
                                leaveData: pendingLeaves.leaveReason),
                            TextfieldLabelWidget(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter Comments';
                                  }
                                  return null;
                                },
                                label: StringConstants.kComments,
                                hintText: StringConstants.kComments,
                                maxLines: 5,
                                onTextFieldChanged: (text) {
                                  context.read<LeavesBloc>().leaveStatusMap["comment"] =
                                    text;
                                })
                          ]),
                    )))),
        actions: [
          Padding(
              padding: const EdgeInsets.only(bottom: spacingLarge),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RejectLeaveButton(updateKey: updateKey, pendingLeaves: pendingLeaves),
                    const SizedBox(width: spacingLarge),
                    ApproveLeaveButton(updateKey: updateKey,pendingLeaves: pendingLeaves)
                  ]))
        ]);
  }
}