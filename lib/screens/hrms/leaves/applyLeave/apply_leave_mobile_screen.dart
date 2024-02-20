import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/leaves/leaves_bloc.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/data/enums/leave_type.dart';
import 'package:saasify/data/models/leaves/load_apply_leave_screen_model.dart';
import 'package:saasify/screens/hrms/leaves/applyLeave/apply_leave_button.dart';
import 'package:saasify/screens/hrms/leaves/widgets/date_picker_textfield.dart';
import 'package:saasify/screens/hrms/leaves/widgets/leave_statistic_card.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/text/custom_dropdown_widget.dart';
import 'package:saasify/widgets/layoutWidgets/multifield_row.dart';
import 'package:saasify/widgets/text/dropdown_label_widget.dart';
import 'package:saasify/widgets/text/textfield_label_widget.dart';

class ApplyLeaveMobileScreen extends StatelessWidget {
  final bool? isDetailScreen;
  final ApplyLeaveData applyLeaveData;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ApplyLeaveMobileScreen(
      {super.key, this.isDetailScreen = false, required this.applyLeaveData});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Form(
      key: formKey,
      child: Column(children: [
        MultiFieldRow(childrenWidgets: [
          LeaveStatisticsCard(
              applyLeaveData: applyLeaveData,
              iconData: Icons.medical_services_outlined,
              title: StringConstants.kBalanceMedicalLeaves,
              trailingData: applyLeaveData.medicalLeaves.toString()),
          LeaveStatisticsCard(
              applyLeaveData: applyLeaveData,
              iconData: Icons.medical_services_outlined,
              title: StringConstants.kBalanceCasualLeaves,
              trailingData: applyLeaveData.casualLeaves.toString())
        ]),
        const SizedBox(height: spacingXMedium),
        const Divider(),
        const SizedBox(height: spacingXMedium),
        MultiFieldRow(childrenWidgets: [
          DropdownLabelWidget(
              label: StringConstants.kLeaveType,
              hint: StringConstants.kLeaveType,
              items: List.generate(
                  LeaveTypeEnum.values.length,
                  (index) => CustomDropDownItem(
                      label: LeaveTypeEnum.values.elementAt(index).type,
                      value: LeaveTypeEnum.values.elementAt(index).typeId)),
              onChanged: (value) {
                context.read<LeavesBloc>().leaveDetailsMap['leave_type'] =
                    value;
              }),
          DropdownLabelWidget(
              label: StringConstants.kApprovers,
              hint: StringConstants.kApprovers,
              items: List.generate(
                  applyLeaveData.approvers.length,
                  (index) => CustomDropDownItem(
                      label: applyLeaveData.approvers[index].approverName,
                      value: applyLeaveData.approvers[index].id)),
              onChanged: (value) {
                context.read<LeavesBloc>().leaveDetailsMap['approvers'] = [
                  value
                ];
              })
        ]),
        const SizedBox(height: spacingXMedium),
        const DateDisplayWidget(
          label: 'From Date',
          isStartDate: true,
        ),
        const SizedBox(height: spacingXMedium),
        const DateDisplayWidget(label: 'To Date', isStartDate: false),
        const SizedBox(height: spacingXMedium),
        TextfieldLabelWidget(
            label: StringConstants.kReasonForLeave,
            maxLines: 5,
            onTextFieldChanged: (text) {
              context.read<LeavesBloc>().leaveDetailsMap['leave_reason'] = text;
            }),
        const SizedBox(height: spacingXMedium),
        Align(
            alignment: Alignment.centerRight,
            child: ApplyLeaveButton(formKey: formKey))
      ]),
    ));
  }
}
