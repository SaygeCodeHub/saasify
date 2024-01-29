import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/widgets/icons/circle_card_icon.dart';
import 'package:saasify/widgets/layoutWidgets/multifield_row.dart';
import 'package:saasify/widgets/text/field_label_widget.dart';
import '../../../../data/models/leaves/load_apply_leave_screen_model.dart';
import 'apply_leave_button.dart';

class ApplyAndLeaveDetailMobileScreen extends StatelessWidget {
  final bool? isDetailScreen;
  final ApplyLeaveData applyLeaveData;

  const ApplyAndLeaveDetailMobileScreen(
      {super.key, this.isDetailScreen = false, required this.applyLeaveData});
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
                              padding: const EdgeInsets.all(spacingXSmall),
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
                                    Text(applyLeaveData.medicalLeaves.toString(),
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
                            padding: const EdgeInsets.all(spacingXSmall),
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
                                  Text(applyLeaveData.casualLeaves.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .cardMobileValueLarge
                                          .copyWith(color: AppColors.orange))
                                ]),
                          ))),
          )
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
                      enabledBorder:  const OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.black12)),
                      contentPadding:
                       const EdgeInsets.symmetric(vertical: spacingStandard),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(spacingStandard),
                      ),
                    ),
                    hint:  const Text('Leave Type',
                        style: TextStyle(fontSize: spacingMedium)),
                    items: ['Medical Leaves', 'Casual Leaves']
                        .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(item,
                            style:  const TextStyle(fontSize: spacingMedium))))
                        .toList(),
                    validator: (value) {
                      if (value == null) {
                        return 'Please select Leave Type';
                      }
                      return null;
                    },
                    onChanged: (value) {},
                    buttonStyleData:  const ButtonStyleData(
                      padding: EdgeInsets.only(right: spacingXSmall),
                    ),
                    iconStyleData:  const IconStyleData(
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
                    menuItemStyleData:  const MenuItemStyleData(
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
                        enabledBorder:  const OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.black12)),
                        hintText: 'From Date',
                        suffixIcon: IconButton(
                          onPressed: () => _selectDate(context, fromDateController),
                          icon:  const Icon(Icons.calendar_month_rounded, color: AppColors.black),
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
                            style:  const TextStyle(fontSize: spacingMedium))))
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
