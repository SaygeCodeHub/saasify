import 'package:flutter/material.dart';
import 'package:saasify/configs/new_app_theme.dart';
import 'package:saasify/screens/hrms/add_employee/add_employee_screen.dart';

import '../../../../configs/app_colors.dart';
import '../../../../configs/app_spacing.dart';
import '../../../../utils/constants/string_constants.dart';
import '../../../../widgets/buttons/primary_button.dart';
import '../../../../widgets/userInput/custom_checkbox.dart';

showAlertDialog(BuildContext context) {
  TextButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  AlertDialog alert = AlertDialog(
    actions: [
      PrimaryButton(
          backgroundColor: AppColors.darkBlue,
          onPressed: () {
            Navigator.pushNamed(context, AddEmployeeScreen.routeName);
          },
          buttonWidth: spacingXXXHuge,
          buttonTitle: 'Invite'),
    ],
    title: SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.30,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(StringConstants.kInviteMember),
              InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(
                      context, AddEmployeeScreen.routeName);
                },
                child: Text(
                  "Add Manually?",
                  style: Theme.of(context)
                      .textTheme
                      .drawerModuleTextStyle
                      .copyWith(color: AppColors.orange),
                ),
              ),
            ],
          ),
          const SizedBox(height: spacingSmall),
          const Divider(),
          const SizedBox(height: spacingHuge),
          Text(StringConstants.kEmailAddress,
              style: Theme.of(context).textTheme.userNameTextStyle),
          const SizedBox(height: spacingSmall),
          TextFormField(
            decoration: const InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black12), //<-- SEE HERE
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black12), //<-- SEE HERE
              ),
              counterText: "",
              contentPadding: EdgeInsets.symmetric(
                  vertical: 15, horizontal: 15), // Adjust padding as needed
            ),
          ),
          const SizedBox(height: spacingHuge),
          Text(StringConstants.kAssignRole,
              style: Theme.of(context).textTheme.userNameTextStyle),
          const SizedBox(height: spacingMedium),
          Row(
            children: [
              const Expanded(child: CustomCheckbox()),
              const SizedBox(width: spacingXMedium),
              SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.020,
                  child: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.info)))
            ],
          ),
          const SizedBox(height: spacingMedium),
          Row(
            children: [
              const Expanded(child: CustomCheckbox()),
              const SizedBox(width: spacingXMedium),
              SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.020,
                  child: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.info)))
            ],
          ),
          const SizedBox(height: spacingMedium),
          Row(
            children: [
              const Expanded(child: CustomCheckbox()),
              const SizedBox(width: spacingXMedium),
              SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.020,
                  child: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.info)))
            ],
          ),
          const SizedBox(height: spacingMedium),
          Row(
            children: [
              const Expanded(child: CustomCheckbox()),
              const SizedBox(width: spacingXMedium),
              SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.020,
                  child: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.info)))
            ],
          ),
        ],
      ),
    ),
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
