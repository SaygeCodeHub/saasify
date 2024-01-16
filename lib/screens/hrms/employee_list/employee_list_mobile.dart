import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/new_app_theme.dart';
import 'package:saasify/widgets/generalWidgets/icon_text.dart';

import '../../../configs/app_colors.dart';
import '../../../widgets/generalWidgets/status_chip.dart';

class EmployeeListMobile extends StatelessWidget {
  const EmployeeListMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
              itemCount: 10,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) => const SizedBox(
                    height: spacingSmall,
                  ),
              itemBuilder: (context, index) {
                return const DetailsCard(
                    title: "EmployeeName",
                    status: "InActive",
                    avatarUrl: "https://picsum.photos/200",
                    iconTextData: [
                      IconTextData(
                          text: "employee@mail.com",
                          icon: Icons.email_outlined),
                      IconTextData(text: "9999988888", icon: Icons.phone),
                      IconTextData(
                          text: "222, 2nd Floor, State, City, Country",
                          icon: Icons.location_on),
                    ]);
              }),
        ),
      ],
    );
  }
}

class IconTextData {
  final String text;
  final IconData icon;

  const IconTextData({required this.text, required this.icon});
}

class DetailsCard extends StatelessWidget {
  final String title;
  final String status;
  final List<IconTextData> iconTextData;
  final String? avatarUrl;

  const DetailsCard({
    super.key,
    required this.title,
    required this.status,
    this.avatarUrl,
    required this.iconTextData,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
            padding: const EdgeInsets.all(spacingSmall),
            child: Row(children: [
              (avatarUrl != null)
                  ? CircleAvatar(
                      radius: 35,
                      backgroundImage: NetworkImage(avatarUrl ?? ""),
                      backgroundColor: AppColors.black,
                    )
                  : const SizedBox(),
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: spacingStandard),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            OverflowBar(
                                alignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .employeeCardTextStyle
                                        .copyWith(
                                            color: AppColors.darkBlue,
                                            fontWeight: FontWeight.w700),
                                  ),
                                  StatusChip(
                                      text: status, color: AppColors.errorRed)
                                ]),
                            const SizedBox(height: spacingXXSmall),
                            ListView.separated(
                                shrinkWrap: true,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: spacingXXSmall),
                                itemBuilder: (context, index) {
                                  return IconText(
                                    text: iconTextData[index].text,
                                    icon: iconTextData[index].icon,
                                  );
                                },
                                itemCount: iconTextData.length,
                                physics: const NeverScrollableScrollPhysics()),
                          ])))
            ])));
  }
}
