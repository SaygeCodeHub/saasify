import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/new_app_theme.dart';
import 'package:saasify/data/enums/employee_type_enum.dart';
import 'package:saasify/screens/hrms/add_employee/add_employee_screen.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/utils/globals.dart';
import 'package:saasify/widgets/buttons/primary_button.dart';
import 'package:saasify/widgets/userInput/custom_checkbox.dart';

showAddEmployeeDialog(BuildContext context) {
  bool isMobile = MediaQuery.of(context).size.width < mobileBreakPoint;
  AlertDialog alert = AlertDialog(
      actions: [
        PrimaryButton(
            backgroundColor: AppColors.darkBlue,
            onPressed: () {},
            buttonWidth: spacingXXXHuge,
            buttonTitle: 'Invite')
      ],
      title: SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.30,
          child:
              OverflowBar(alignment: MainAxisAlignment.spaceBetween, children: [
            const Text(StringConstants.kInviteMember),
            InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, AddEmployeeScreen.routeName);
              },
              child: Text("Add Manually?",
                  style: Theme.of(context)
                      .textTheme
                      .drawerModuleTextStyle
                      .copyWith(color: AppColors.orange)),
            )
          ])),
      content: SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.30,
          height: isMobile ? MediaQuery.sizeOf(context).height * 0.60 : null,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Divider(),
                const SizedBox(height: spacingHuge),
                Text(StringConstants.kEmailAddress,
                    style: Theme.of(context).textTheme.userNameTextStyle),
                const SizedBox(height: spacingSmall),
                TextFormField(
                    decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black12)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black12)),
                        counterText: "",
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15))),
                const SizedBox(height: spacingHuge),
                Text(StringConstants.kAssignRole,
                    style: Theme.of(context).textTheme.userNameTextStyle),
                const SizedBox(height: spacingMedium),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                        children: List.generate(
                            EmployeeType.values.length,
                            (index) => Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: spacingSmall),
                                child: Row(children: [
                                  Expanded(
                                      child: CustomCheckbox(
                                          checkBoxTitle:
                                              EmployeeType.values[index].name)),
                                  const SizedBox(width: spacingXMedium),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.info))
                                ])))),
                  ),
                )
              ])));
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      });
}
