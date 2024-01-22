import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/widgets/icons/icon_with_card.dart';

import '../../../../configs/app_colors.dart';
import '../../../../configs/app_spacing.dart';
import '../../../../widgets/layoutWidgets/multifield_row.dart';
import '../../../../widgets/text/field_label_widget.dart';
import 'apply_leave_button.dart';

class ApplyAndLeaveDetailMobileScreen extends StatelessWidget {
  final bool? isDetailScreen;

  const ApplyAndLeaveDetailMobileScreen(
      {super.key, this.isDetailScreen = false});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Row(children: [
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
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const CircleCardIcon(
                                        icon: Icons.medical_services_outlined),
                                    const SizedBox(height: spacingSmall),
                                    Text("Balance Medical Leaves",
                                        style: Theme.of(context)
                                            .textTheme
                                            .cardMobileHeadingLarge
                                            .copyWith(
                                                color: AppColors.darkBlue)),
                                    const SizedBox(height: spacingXSmall),
                                    Text('12',
                                        style: Theme.of(context)
                                            .textTheme
                                            .cardMobileValueLarge
                                            .copyWith(color: AppColors.orange))
                                  ]),
                            )))),
          Expanded(
            child: Card(
                elevation: 0,
                child: Padding(
                    padding: const EdgeInsets.all(spacingSmallest),
                    child: (isDetailScreen!)
                        ? const ListTile(
                            leading:
                                Icon(Icons.comment, color: AppColors.orange),
                            title: Text("Comments"),
                            trailing: Text("Rejected due to some reason"))
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const CircleCardIcon(
                                      icon: Icons.volunteer_activism_outlined),
                                  const SizedBox(height: spacingSmall),
                                  Text("Balance Casual Leaves",
                                      style: Theme.of(context)
                                          .textTheme
                                          .cardMobileHeadingLarge
                                          .copyWith(color: AppColors.darkBlue)),
                                  const SizedBox(height: spacingXSmall),
                                  Text('3',
                                      style: Theme.of(context)
                                          .textTheme
                                          .cardMobileValueLarge
                                          .copyWith(color: AppColors.orange))
                                ]),
                          ))),
          )
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
