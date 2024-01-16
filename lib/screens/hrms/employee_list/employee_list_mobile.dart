import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/new_app_theme.dart';

import '../../../configs/app_colors.dart';
import '../../../widgets/generalWidgets/status_chip.dart';
import '../../../widgets/userInput/custom_drop_down.dart';

class EmployeeListMobile extends StatelessWidget {
  const EmployeeListMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: spacingMedium),
        Row(children: [
          CustomDropDown(
              items: const ["Last 30 Days", "Last Week"],
              defaultValue: "Last 30 Days",
              icon: Icons.store,
              onChanged: (value) {}
          ),
        ]),
        const SizedBox(height: spacingMedium),
        Expanded(
          child: ListView.separated(
              itemCount: 10,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) => const SizedBox(
                    height: spacingSmall,
                  ),
              itemBuilder: (context, index) {
                return const EmployeeCard();
              }),
        ),
      ],
    );
  }
}

class EmployeeCard extends StatelessWidget {
  const EmployeeCard({
    super.key,
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
      child: Row(
        children: [
          const CircleAvatar(
            radius: 35,
            backgroundImage:
                (null != null) ? NetworkImage("avatarUrl") : null,
            backgroundColor: AppColors.black,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacingStandard),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Employee Name",
                      style: Theme.of(context)
                          .textTheme
                          .employeeCardTextStyle
                          .copyWith(
                              color: AppColors.darkBlue,
                              fontWeight: FontWeight.w700),
                    ),
                    const StatusChip(text: "Inactive", color: AppColors.errorRed)
                  ],
                ),
                const SizedBox(height: spacingXXSmall),
                Row(mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.email_outlined,
                        color: AppColors.darkBlue, size: 16),
                    const SizedBox(width: spacingXSmall),
                    Text("Email@mail.com",
                        style: Theme.of(context)
                            .textTheme
                            .employeeCardTextStyle),
                  ],
                ),
                const SizedBox(height: spacingXXSmall),
                Row(mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.phone_outlined,
                        color: AppColors.darkBlue, size: 16),
                    const SizedBox(width: spacingXSmall),
                    Text("9999988888",
                        style: Theme.of(context)
                            .textTheme
                            .employeeCardTextStyle),
                  ],
                ),
                Row(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top:spacingXXSmall),
                      child: Icon(Icons.location_on_outlined,
                          color: AppColors.darkBlue, size: 16),
                    ),
                    const SizedBox(width: spacingXSmall),
                    Expanded(
                      child: Text("222, 2nd Floor, Street, City, State, Country",
                          style: Theme.of(context)
                              .textTheme
                              .employeeCardTextStyle),
                    ),
                  ],
                )],
            ),
          ))
        ],
      ),
    ));
  }
}
