import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/screens/settings/employee_list.dart';
import 'package:saasify/utils/responsive.dart';
import '../../configs/app_spacing.dart';
import '../../utils/constants/string_constants.dart';
import '../../widgets/custom_dropdown.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/secondary_button.dart';
import '../../widgets/sidebar.dart';
import '../../widgets/top_bar.dart';

class AddEmployeeScreen extends StatelessWidget {
  static const String routeName = 'AddEmployeeScreen';

  static Map dataMap = {};

  static List<int> selectedIds = [];

  AddEmployeeScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: const SideBar(selectedIndex: 1),
        body: Flex(
            crossAxisAlignment: CrossAxisAlignment.start,
            direction:
                context.responsive(Axis.vertical, desktop: Axis.horizontal),
            children: [
              context.responsive(
                  TopBar(
                      scaffoldKey: _scaffoldKey,
                      headingText: StringConstants.kDashboard),
                  desktop: const Expanded(
                    child: SideBar(selectedIndex: 1),
                  )),
              Expanded(
                  flex: 5,
                  child: Padding(
                      padding: const EdgeInsets.all(spacingLarge),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: InkWell(
                                        onTap: () {
                                          Navigator.pushReplacementNamed(
                                              context,
                                              EmployeeListScreen.routeName);
                                        },
                                        child: const Icon(
                                            Icons.arrow_back_ios_new))),
                                const SizedBox(width: spacingSmall),
                                context.responsive(const SizedBox.shrink(),
                                    desktop: Text(StringConstants.kAddEmployee,
                                        style: Theme.of(context)
                                            .textTheme
                                            .xxTiny
                                            .copyWith(
                                                fontWeight: FontWeight.w700))),
                              ],
                            ),
                            const SizedBox(height: spacingMedium),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                          Text(StringConstants.kFirstName,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .xxTiniest
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w700)),
                                          const SizedBox(height: spacingSmall),
                                          CustomTextField(
                                              onTextFieldChanged: (value) {}),
                                          const SizedBox(
                                              height: spacingStandard),
                                          Text(StringConstants.kMobileNo,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .xxTiniest
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w700)),
                                          const SizedBox(height: spacingSmall),
                                          CustomTextField(
                                              onTextFieldChanged: (value) {}),
                                          const SizedBox(
                                              height: spacingStandard),
                                          Text(StringConstants.kEmailAddress,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .xxTiniest
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w700)),
                                          const SizedBox(height: spacingSmall),
                                          CustomTextField(
                                              onTextFieldChanged: (value) {}),
                                          const SizedBox(
                                              height: spacingStandard),
                                        ])),
                                    const SizedBox(width: spacingExcel),
                                    Expanded(
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                          Text(StringConstants.kLastName,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .xxTiniest
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w700)),
                                          const SizedBox(height: spacingSmall),
                                          CustomTextField(
                                              onTextFieldChanged: (value) {}),
                                          const SizedBox(
                                              height: spacingStandard),
                                          Text(StringConstants.kType,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .xxTiniest
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w700)),
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
                                          const SizedBox(
                                              height: spacingStandard),
                                          Text(StringConstants.kPassword,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .xxTiniest
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w700)),
                                          const SizedBox(height: spacingSmall),
                                          CustomTextField(
                                              onTextFieldChanged: (value) {}),
                                          const SizedBox(
                                              height: spacingStandard),
                                        ]))
                                  ]),
                            ),
                            const SizedBox(height: 50),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SecondaryButton(
                                      onPressed: () {},
                                      buttonWidth: spacingXXXXHuge,
                                      buttonTitle: StringConstants.kCancel),
                                  const SizedBox(width: spacingExcel),
                                  PrimaryButton(
                                      onPressed: () {},
                                      buttonWidth: spacingXXXXHuge,
                                      buttonTitle: StringConstants.kAdd)
                                ])
                          ])))
            ]));
  }
}
