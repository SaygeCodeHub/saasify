import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/data/models/leaves/get_all_leaves_model.dart';
import 'package:saasify/screens/hrms/leaves/widgets/leave_details_navigation_screen.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/utils/formatters.dart';
import 'package:saasify/widgets/generalWidgets/status_chip.dart';

class MyLeavesMobileScreen extends StatelessWidget {
  final List<MyLeaves> myLeaves;

  const MyLeavesMobileScreen({super.key, required this.myLeaves});

  @override
  Widget build(BuildContext context) {
    if (myLeaves.isEmpty) {
      return const Center(
        child: Text(StringConstants.kNoLeavesFound),
      );
    }
    return ListView.separated(
        separatorBuilder: (context, index) {
          return const SizedBox(height: spacingSmall);
        },
        itemCount: myLeaves.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(
                  context, LeaveDetailsNavigationScreen.routeName,
                  arguments: [false, myLeaves[index]]);
            },
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.lighterBlack),
                    borderRadius: BorderRadius.circular(kCardRadius)),
                child: Padding(
                    padding: const EdgeInsets.all(spacingStandard),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.time_to_leave),
                              const SizedBox(width: spacingSmall),
                              Text(myLeaves[index].leaveType.toString()),
                            ],
                          ),
                          StatusChip(
                              text: myLeaves[index].leaveStatus.toString(),
                              color: getColorFromStatus(
                                  myLeaves[index].leaveStatus.toString())),
                        ],
                      ),
                      const SizedBox(height: spacingStandard),
                      Row(
                        children: [
                          const Icon(Icons.date_range_outlined),
                          const SizedBox(width: spacingSmall),
                          Text(formatDate(
                            myLeaves[index].startDate.toString(),
                          )),
                          const Text(' - '),
                          Text(formatDate(myLeaves[index].endDate.toString())),
                          const Spacer(),
                          const Icon(Icons.navigate_next_rounded,
                              color: AppColors.lighterBlack)
                        ],
                      ),
                    ]))),
          );
        });
  }
}
