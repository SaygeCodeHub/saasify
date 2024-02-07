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
import 'package:saasify/utils/formatters.dart';
import 'package:saasify/widgets/generalWidgets/status_chip.dart';
import 'package:saasify/widgets/text/module_heading.dart';
import 'package:saasify/widgets/text/textfield_label_widget.dart';
import 'package:saasify/configs/app_dimensions.dart';

class LeaveDetailsPopup extends StatelessWidget {
  final bool isMobile;
  final MyLeaves leaves;
  final Function? onPressed;
  final bool isPending;
  final GlobalKey<FormState> updateKey = GlobalKey<FormState>();

  LeaveDetailsPopup(
      {super.key,
      required this.isMobile,
      required this.leaves,
      this.onPressed,
      required this.isPending});

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
        title: ModuleHeading(
            label: isPending
                ? StringConstants.kUpdateLeaveStatus
                : StringConstants.kMyLeaveDetails),
        content: SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.5,
            width: MediaQuery.sizeOf(context).width * 0.5,
            child: Card(
                child: Padding(
                    padding: const EdgeInsets.all(spacingMedium),
                    child: Form(
                        key: updateKey,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Visibility(
                                  visible: isPending,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      LeaveDetails(
                                        title: StringConstants.kApplicantName,
                                        leaveData: leaves.name.toString(),
                                      ),
                                      const SizedBox(height: spacingSmall)
                                    ],
                                  )),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  LeaveDetails(
                                      title: StringConstants.kLeaveType,
                                      leaveData: leaves.leaveType),
                                  Visibility(
                                      visible: isPending ? false : true,
                                      child: Center(
                                        child: StatusChip(
                                            text: leaves.leaveStatus.toString(),
                                            color: getColorFromStatus(
                                                leaves.leaveStatus.toString())),
                                      )),
                                ],
                              ),
                              const SizedBox(height: spacingSmall),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  LeaveDetails(
                                      title: StringConstants.kStartDate,
                                      leaveData: DateFormat("yyyy-MM-dd")
                                          .format(leaves.startDate)),
                                  const SizedBox(width: spacingXXHuge),
                                  LeaveDetails(
                                      title: StringConstants.kEndDate,
                                      leaveData: DateFormat("yyyy-MM-dd")
                                          .format(leaves.endDate)),
                                ],
                              ),
                              const SizedBox(height: spacingSmall),
                              LeaveDetails(
                                  title: StringConstants.kLeaveReason,
                                  leaveData: leaves.leaveReason),
                              Visibility(
                                  visible: isPending ? false : true,
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const SizedBox(height: spacingSmall),
                                        LeaveDetails(
                                            title: StringConstants.kApprovers,
                                            leaveData:
                                                leaves.approvers.join(", ")),
                                      ])),
                              Visibility(
                                  visible: isPending,
                                  replacement: leaves.leaveStatus == "PENDING"
                                      ? const SizedBox()
                                      : Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                              const SizedBox(
                                                  height: spacingSmall),
                                              Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                        "${StringConstants.kComments} :",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                    const SizedBox(
                                                        height: spacingSmall),
                                                    Container(
                                                        width: double.maxFinite,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    kCircularRadius),
                                                            border: Border.all(
                                                                color: Colors
                                                                    .black26)),
                                                        padding:
                                                            const EdgeInsets
                                                                .all(spacingXSmall),
                                                        child: Text(
                                                            leaves.comment,
                                                            maxLines: 5))
                                                  ])
                                            ]),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const SizedBox(height: spacingSmall),
                                        TextfieldLabelWidget(
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please enter Comments';
                                              }
                                              return null;
                                            },
                                            label: StringConstants.kComments,
                                            hintText: StringConstants.kComments,
                                            maxLines: 5,
                                            onTextFieldChanged: (text) {
                                              context
                                                      .read<LeavesBloc>()
                                                      .leaveStatusMap[
                                                  "comment"] = text;
                                            })
                                      ]))
                            ]))))),
        actions: [
          Visibility(
              visible: isPending,
              replacement: const SizedBox.shrink(),
              child: Padding(
                  padding: const EdgeInsets.only(bottom: spacingLarge),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RejectLeaveButton(
                            updateKey: updateKey, pendingLeaves: leaves),
                        const SizedBox(width: spacingLarge),
                        ApproveLeaveButton(
                            updateKey: updateKey, pendingLeaves: leaves)
                      ])))
        ]);
  }
}
