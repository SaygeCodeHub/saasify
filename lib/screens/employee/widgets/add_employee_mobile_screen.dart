import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';
import '../../../configs/app_spacing.dart';
import '../../../utils/constants/string_constants.dart';
import '../../../widgets/custom_dropdown.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/primary_button.dart';
import '../../../widgets/secondary_button.dart';
import '../employee_list.dart';

class AddEmployeeMobileScreen extends StatelessWidget {
  const AddEmployeeMobileScreen({
    super.key,
    required this.dataMap,
  });

  final Map dataMap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        SecondaryButton(
            onPressed: () {
              Navigator.pushReplacementNamed(
                  context, EmployeeListScreen.routeName);
            },
            buttonWidth: spacingXXXXXHuge,
            buttonTitle: StringConstants.kCancel),
        PrimaryButton(
            onPressed: () {},
            buttonWidth: spacingXXXXXHuge,
            buttonTitle: StringConstants.kAdd)
      ]),
      body: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, EmployeeListScreen.routeName);
                      },
                      child: const Icon(Icons.arrow_back_ios_new)))
            ]),
            const SizedBox(height: spacingMedium),
            Padding(
                padding: const EdgeInsets.all(spacingLarge),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Text(StringConstants.kFirstName,
                                style: Theme.of(context)
                                    .textTheme
                                    .xxTiniest
                                    .copyWith(fontWeight: FontWeight.w700)),
                            const SizedBox(height: spacingSmall),
                            CustomTextField(onTextFieldChanged: (value) {}),
                            const SizedBox(height: spacingStandard),
                            Text(StringConstants.kMobileNo,
                                style: Theme.of(context)
                                    .textTheme
                                    .xxTiniest
                                    .copyWith(fontWeight: FontWeight.w700)),
                            const SizedBox(height: spacingSmall),
                            CustomTextField(onTextFieldChanged: (value) {}),
                            const SizedBox(height: spacingStandard),
                            Text(StringConstants.kEmailAddress,
                                style: Theme.of(context)
                                    .textTheme
                                    .xxTiniest
                                    .copyWith(fontWeight: FontWeight.w700)),
                            const SizedBox(height: spacingSmall),
                            CustomTextField(onTextFieldChanged: (value) {}),
                            const SizedBox(height: spacingStandard),
                          ])),
                      const SizedBox(width: spacingExcel),
                      Expanded(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Text(StringConstants.kLastName,
                                style: Theme.of(context)
                                    .textTheme
                                    .xxTiniest
                                    .copyWith(fontWeight: FontWeight.w700)),
                            const SizedBox(height: spacingSmall),
                            CustomTextField(onTextFieldChanged: (value) {}),
                            const SizedBox(height: spacingStandard),
                            Text(StringConstants.kType,
                                style: Theme.of(context)
                                    .textTheme
                                    .xxTiniest
                                    .copyWith(fontWeight: FontWeight.w700)),
                            const SizedBox(height: spacingSmall),
                            CustomDropdownWidget(
                                initialValue: 'Owner',
                                listItems: const [
                                  "Owner",
                                  "Employee",
                                  "Accountant",
                                ],
                                dataMap: dataMap,
                                mapKey: ''),
                            const SizedBox(height: spacingStandard),
                            Text(StringConstants.kPassword,
                                style: Theme.of(context)
                                    .textTheme
                                    .xxTiniest
                                    .copyWith(fontWeight: FontWeight.w700)),
                            const SizedBox(height: spacingSmall),
                            CustomTextField(onTextFieldChanged: (value) {}),
                            const SizedBox(height: spacingStandard)
                          ]))
                    ]))
          ]),
    );
  }
}
