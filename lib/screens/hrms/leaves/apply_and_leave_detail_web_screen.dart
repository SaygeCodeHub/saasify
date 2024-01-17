import 'package:flutter/material.dart';
import 'package:saasify/screens/hrms/leaves/apply_leave_button.dart';
import 'package:saasify/widgets/text/field_label_widget.dart';

import '../../../configs/app_colors.dart';
import '../../../configs/app_spacing.dart';
import '../../../widgets/layoutWidgets/background_card_widget.dart';
import '../../../widgets/layoutWidgets/multifield_row.dart';

class ApplyAndLeaveDetailWebScreen extends StatelessWidget {
  final bool? isDetailScreen;

  const ApplyAndLeaveDetailWebScreen({super.key, this.isDetailScreen = false});

  @override
  Widget build(BuildContext context) {
    return BackgroundCardWidget(
        childScreen: Column(children: [
      MultiFieldRow(childrenWidgets: [
        Expanded(
          child: Card(
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
        ),
        Expanded(
          child: Card(
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
                          trailing: Text('3')))),
        )
      ]),
      const Divider(),
      const Padding(
        padding: EdgeInsets.all(spacingMedium),
        child: MultiFieldRow(
          childrenWidgets: [
            Expanded(child: LabelAndFieldWidget(label: 'Leave Type')),
            SizedBox(width: spacingLarge),
            Expanded(child: LabelAndFieldWidget(label: 'From Date')),
            SizedBox(width: spacingLarge),
            Expanded(child: LabelAndFieldWidget(label: 'To Date')),
            SizedBox(width: spacingLarge),
            Expanded(child: LabelAndFieldWidget(label: 'Approver'))
          ],
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(spacingMedium),
        child: MultiFieldRow(
          childrenWidgets: [
            Expanded(child: LabelAndFieldWidget(label: 'Reason', maxLines: 5))
          ],
        ),
      ),
      const Padding(
          padding: EdgeInsets.all(spacingMedium),
          child: Align(
              alignment: Alignment.centerRight, child: ApplyLeaveButton()))
    ]));
  }
}
