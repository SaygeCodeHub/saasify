import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:saasify/screens/hrms/leaves/widgets/apply_leave_button.dart';
import 'package:saasify/widgets/text/field_label_widget.dart';

import '../../../../configs/app_colors.dart';
import '../../../../configs/app_spacing.dart';
import '../../../../data/models/leaves/load_apply_leave_model.dart';
import '../../../../widgets/layoutWidgets/background_card_widget.dart';
import '../../../../widgets/layoutWidgets/multifield_row.dart';

class ApplyAndLeaveDetailWebScreen extends StatelessWidget {
  final bool? isDetailScreen;
  final ApplyLeaveData applyLeaveData;

  const ApplyAndLeaveDetailWebScreen({super.key, this.isDetailScreen = false, required this.applyLeaveData});

  Future<void> _selectDate(BuildContext context, TextEditingController dateController) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1940, 1, 1),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      dateController.text = pickedDate.toString().split(" ")[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController fromDateController = TextEditingController();
    TextEditingController toDateController = TextEditingController();
    return BackgroundCardWidget(
        childScreen: Column(children: [
          MultiFieldRow(childrenWidgets: [
            Card(
                elevation: 0,
                child: Padding(
                    padding: const EdgeInsets.all(spacingSmallest),
                    child: (isDetailScreen!)
                        ? const ListTile(
                        leading: Icon(Icons.approval, color: AppColors.orange),
                        title: Text("Status"),
                        trailing: Text("Approved"))
                        : ListTile(
                        leading: const Icon(Icons.medical_services_outlined,
                            color: AppColors.orange),
                        title: const Text("Balance Medical Leaves"),
                        trailing: Text(applyLeaveData.medicalLeaves.toString())))),
            Card(
                elevation: 0,
                child: Padding(
                    padding: const EdgeInsets.all(spacingSmallest),
                    child: (isDetailScreen!)
                        ? const ListTile(
                        leading: Icon(Icons.comment, color: AppColors.orange),
                        title: Text("Comments"),
                        trailing: Text("Rejected due to some reason"))
                        : ListTile(
                        leading: const Icon(Icons.volunteer_activism_outlined,
                            color: AppColors.orange),
                        title: const Text("Balance Casual Leaves"),
                        trailing: Text(applyLeaveData.casualLeaves.toString()))))
          ]),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(spacingMedium),
            child: MultiFieldRow(
              childrenWidgets: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(spacingSmallest),
                      child: Text(
                        "Leave Type",
                        style: TextStyle(
                            color: AppColors.black, fontSize: spacingStandard),
                      ),
                    ),
                    const SizedBox(height: spacingXMedium),
                    DropdownButtonFormField2<String>(
                      isExpanded: true,
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.black12)),
                        contentPadding:
                        const EdgeInsets.symmetric(vertical: spacingStandard),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(spacingStandard),
                        ),
                      ),
                      hint: const Text('Leave Type',
                          style: TextStyle(fontSize: spacingMedium)),
                      items: ['Medical Leaves', 'Casual Leaves']
                          .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(item,
                              style: const TextStyle(fontSize: spacingMedium))))
                          .toList(),
                      validator: (value) {
                        if (value == null) {
                          return 'Please select Leave Type';
                        }
                        return null;
                      },
                      onChanged: (value) {},
                      buttonStyleData: const ButtonStyleData(
                        padding: EdgeInsets.only(right: spacingXSmall),
                      ),
                      iconStyleData: const IconStyleData(
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black45,
                        ),
                        iconSize: spacingXLarge,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(spacingStandard),
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        padding: EdgeInsets.symmetric(horizontal: spacingStandard),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(spacingSmallest),
                      child: Text(
                        "From Date",
                        style: TextStyle(
                            color: AppColors.black, fontSize: spacingStandard),
                      ),
                    ),
                    const SizedBox(height: spacingXMedium),
                    TextFormField(
                      controller: fromDateController,
                        decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.black12)),
                          hintText: 'From Date',
                          suffixIcon: IconButton(
                            onPressed: () => _selectDate(context, fromDateController),
                            icon: const Icon(Icons.calendar_month_rounded, color: AppColors.black),
                          ),
                        )),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(spacingSmallest),
                      child: Text(
                        "To Date",
                        style: TextStyle(
                            color: AppColors.black, fontSize: spacingStandard),
                      ),
                    ),
                    const SizedBox(height: spacingXMedium),
                    TextFormField(
                      controller: toDateController,
                        decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.black12)),
                          hintText: 'To Date',
                          suffixIcon: IconButton(
                            onPressed: () => _selectDate(context, toDateController),
                            icon: const Icon(Icons.calendar_month_rounded, color: AppColors.black),
                          ),
                        )),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(spacingSmallest),
                      child: Text(
                        "Approver",
                        style: TextStyle(
                            color: AppColors.black, fontSize: spacingStandard),
                      ),
                    ),
                    const SizedBox(height: spacingXMedium),
                    DropdownButtonFormField2<String>(
                      isExpanded: true,
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.black12)),
                        contentPadding:
                        const EdgeInsets.symmetric(vertical: spacingStandard),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(spacingStandard),
                        ),
                      ),
                      hint: const Text('Approver',
                          style: TextStyle(fontSize: spacingMedium)),
                      items: applyLeaveData.approvers
                          .map((item) => DropdownMenuItem<String>(
                          value: item.toString(),
                          child: Text(item.toString(),
                              style: const TextStyle(fontSize: spacingMedium))))
                          .toList(),
                      validator: (value) {
                        if (value == null) {
                          return 'Please select Approver';
                        }
                        return null;
                      },
                      onChanged: (value) {},
                      buttonStyleData: const ButtonStyleData(
                        padding: EdgeInsets.only(right: spacingXSmall),
                      ),
                      iconStyleData: const IconStyleData(
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black45,
                        ),
                        iconSize: spacingXLarge,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(spacingStandard),
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        padding: EdgeInsets.symmetric(horizontal: spacingStandard),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(spacingMedium),
            child: MultiFieldRow(
              childrenWidgets: [LabelAndFieldWidget(label: 'Reason', maxLines: 5)],
            ),
          ),
          const Padding(
              padding: EdgeInsets.all(spacingMedium),
              child: Align(
                  alignment: Alignment.centerRight, child: ApplyLeaveButton()))
        ]));
  }
}
