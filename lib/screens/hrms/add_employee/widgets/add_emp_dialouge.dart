import 'package:flutter/material.dart';

showAddEmployeeDialog(BuildContext context) {
  // AlertDialog alert = AlertDialog(
  //     actions: [
  //       PrimaryButton(
  //           backgroundColor: AppColors.darkBlue,
  //           onPressed: () {},
  //           buttonWidth: spacingXXXHuge,
  //           buttonTitle: 'Invite'),
  //     ],
  //     title: SizedBox(
  //         width: MediaQuery.sizeOf(context).width * 0.30,
  //         child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             children: [
  //               OverflowBar(
  //                   alignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     const Text(StringConstants.kInviteMember),
  //                     InkWell(
  //                       onTap: () {
  //                         Navigator.pushReplacementNamed(
  //                             context, AddEmployeeScreen.routeName);
  //                       },
  //                       child: Text("Add Manually?",
  //                           style: Theme.of(context)
  //                               .textTheme
  //                               .drawerModuleTextStyle
  //                               .copyWith(color: AppColors.orange)),
  //                     )
  //                   ]),
  //               const SizedBox(height: spacingSmall),
  //               const Divider(),
  //               const SizedBox(height: spacingHuge),
  //               Text(StringConstants.kEmailAddress,
  //                   style: Theme.of(context).textTheme.userNameTextStyle),
  //               const SizedBox(height: spacingSmall),
  //               TextFormField(
  //                   decoration: const InputDecoration(
  //                       focusedBorder: OutlineInputBorder(
  //                           borderSide: BorderSide(color: Colors.black12)),
  //                       enabledBorder: OutlineInputBorder(
  //                           borderSide: BorderSide(color: Colors.black12)),
  //                       counterText: "",
  //                       contentPadding: EdgeInsets.symmetric(
  //                           vertical: 15, horizontal: 15))),
  //               const SizedBox(height: spacingHuge),
  //               Text(StringConstants.kAssignRole,
  //                   style: Theme.of(context).textTheme.userNameTextStyle),
  //               const SizedBox(height: spacingMedium),
  //               Column(
  //                   children: List.generate(
  //                       EmployeeType.values.length,
  //                       (index) => Padding(
  //                           padding: const EdgeInsets.symmetric(
  //                               vertical: spacingSmall),
  //                           child: Row(children: [
  //                             Expanded(
  //                                 child: CustomCheckbox(
  //                                     checkBoxTitle:
  //                                         EmployeeType.values[index].name)),
  //                             const SizedBox(width: spacingXMedium),
  //                             IconButton(
  //                                 onPressed: () {},
  //                                 icon: const Icon(Icons.info))
  //                           ]))))
  //             ])));
  // showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return alert;
  //     });
}
