import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/data/models/leaves/load_apply_leave_screen_model.dart';
import 'package:saasify/screens/hrms/leaves/applyLeave/apply_leave_button.dart';
import 'package:saasify/screens/hrms/leaves/applyLeave/apply_leave_screen.dart';
import 'package:saasify/screens/hrms/leaves/widgets/leave_statistic_card.dart';
import 'package:saasify/widgets/layoutWidgets/background_card_widget.dart';
import 'package:saasify/widgets/layoutWidgets/multifield_row.dart';
import 'package:saasify/widgets/text/calendar_dropdown_label_widget.dart';
import 'package:saasify/widgets/text/dropdown_label_widget.dart';
import 'package:saasify/widgets/text/textfield_label_widget.dart';


class ApplyLeaveWebScreen extends StatelessWidget {
  final bool? isDetailScreen;
  final ApplyLeaveData applyLeaveData;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ApplyLeaveWebScreen(
      {super.key, this.isDetailScreen = false, required this.applyLeaveData});

  @override
  Widget build(BuildContext context) {
    TextEditingController fromDateController = TextEditingController();
    TextEditingController toDateController = TextEditingController();
    return BackgroundCardWidget(
        childScreen: Column(children: [
      Padding(
        padding: const EdgeInsets.all(spacingMedium),
        child: MultiFieldRow(childrenWidgets: [
          LeaveStatisticsCard(
            applyLeaveData: applyLeaveData,
            iconData: Icons.medical_services_outlined,
            title: 'Balance Medical Leaves',
            trailingData: applyLeaveData.medicalLeaves.toString(),
          ),
          LeaveStatisticsCard(
            applyLeaveData: applyLeaveData,
            iconData: Icons.medical_services_outlined,
            title: 'Balance Medical Leaves',
            trailingData: applyLeaveData.casualLeaves.toString(),
          ),
        ]),
      ),
      const Divider(),
      Padding(
        padding: const EdgeInsets.all(spacingMedium),
        child: MultiFieldRow(
          childrenWidgets: [
            DropdownLabelWidget(
              label: 'Leave Type',
              hint: 'Leave Type',
              items: const ['Medical Leaves', 'Casual Leaves'],
              onChanged: (String? value) {},
            ),
            CalendarDropDownLabelWidget(
                text: 'From Date',
                hintText: 'From Date',
                dateController: fromDateController,
                onChanged: (value) {
                  ApplyLeaveScreen.leavesMap['start_date'] = value;
                }),
            CalendarDropDownLabelWidget(
              text: 'To Date',
              hintText: 'To Date',
              dateController: toDateController,
              onChanged: (String? value) {
                ApplyLeaveScreen.leavesMap['end_date'] = value;
              },
            ),
            DropdownLabelWidget(
              label: 'Approver',
              hint: 'Approver',
              items: const ['1'],
              onChanged: (String? value) {},
            ),
          ],
        ),
      ),
      const SizedBox(height: spacingXMedium),
      Padding(
        padding: const EdgeInsets.all(spacingMedium),
        child: TextfieldLabelWidget(
          label: 'Reason',
          maxLines: 5,
          onTextFieldChanged: (text) {
            ApplyLeaveScreen.leavesMap["leave_reason"] = text;
          },
        ),
      ),
      const SizedBox(height: spacingXMedium),
      Padding(
          padding: const EdgeInsets.all(spacingMedium),
          child: Align(
              alignment: Alignment.centerRight,
              child: ApplyLeaveButton(
                formKey: formKey,
              ))),
    ]));
  }
}
