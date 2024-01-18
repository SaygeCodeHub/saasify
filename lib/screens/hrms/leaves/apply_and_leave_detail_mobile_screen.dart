import 'package:flutter/material.dart';

import '../../../configs/app_colors.dart';
import '../../../configs/app_spacing.dart';
import '../../../widgets/layoutWidgets/multifield_row.dart';
import '../../../widgets/text/field_label_widget.dart';
import 'apply_leave_button.dart';

class ApplyAndLeaveDetailMobileScreen extends StatelessWidget {
  final bool? isDetailScreen;

  const ApplyAndLeaveDetailMobileScreen(
      {super.key, this.isDetailScreen = false});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        MultiFieldRow(childrenWidgets: [
          Card(
              elevation: 0,
              child: Padding(
                  padding: const EdgeInsets.all(spacingSmallest),
                  child: (isDetailScreen!)
                      ? const ListTile(
                          leading:
                              Icon(Icons.approval, color: AppColors.orange),
                          title: Text("Status"),
                          trailing: Text("Approved"))
                      : const ListTile(
                          leading: Icon(Icons.medical_services_outlined,
                              color: AppColors.orange),
                          title: Text("Balance Medical Leaves"),
                          trailing: Text('12')))),
          Card(
              elevation: 0,
              child: Padding(
                  padding: const EdgeInsets.all(spacingSmallest),
                  child: (isDetailScreen!)
                      ? const ListTile(
                          leading: Icon(Icons.comment, color: AppColors.orange),
                          title: Text("Comments"),
                          trailing: Text("Rejected due to some reason"))
                      : const ListTile(
                          leading: Icon(Icons.volunteer_activism_outlined,
                              color: AppColors.orange),
                          title: Text("Balance Casual Leaves"),
                          trailing: Text('3'))))
        ]),
        const Divider(),
        const Padding(
          padding: EdgeInsets.all(spacingMedium),
          child: MultiFieldRow(
            childrenWidgets: [
              LabelAndFieldWidget(label: 'Leave Type'),
              LabelAndFieldWidget(label: 'From Date'),
              LabelAndFieldWidget(label: 'To Date'),
              LabelAndFieldWidget(label: 'Approver')
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(spacingMedium),
          child: MultiFieldRow(
            childrenWidgets: [
              LabelAndFieldWidget(label: 'Reason', maxLines: 5)
            ],
          ),
        ),
        const Padding(
            padding: EdgeInsets.all(spacingMedium),
            child: Align(
                alignment: Alignment.centerRight, child: ApplyLeaveButton()))
      ]),
    );
  }
}
