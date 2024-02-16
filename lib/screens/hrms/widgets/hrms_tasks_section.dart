import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/initialise/initialise_bloc.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/screens/hrms/widgets/build_date.dart';
import 'package:saasify/utils/formatters.dart';
import 'package:saasify/widgets/generalWidgets/status_chip.dart';
import 'package:saasify/widgets/text/module_heading.dart';

class HrmsTasksSection extends StatelessWidget {
  final bool isMobile;

  const HrmsTasksSection({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final int tasksAssignedCount = context
        .read<InitialiseAppBloc>()
        .initialiseAppModel!
        .data!
        .tasksAssignedToMe!
        .length;
    final bool showViewAllButton =
        !isMobile ? tasksAssignedCount > 5 : tasksAssignedCount > 2;
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const ModuleHeading(label: 'Task Boards'),
            showViewAllButton
                ? buildViewAllButton(context)
                : const SizedBox.shrink()
          ],
        ),
        const SizedBox(height: spacingLarger),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 2 : 5,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              childAspectRatio: isMobile ? 1.4 : 1.6),
          itemCount: context
              .read<InitialiseAppBloc>()
              .initialiseAppModel!
              .data!
              .tasksAssignedToMe!
              .length,
          itemBuilder: (context, index) {
            var data = context
                .read<InitialiseAppBloc>()
                .initialiseAppModel!
                .data!
                .tasksAssignedToMe!;
            return InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.lightestYellow,
                    border: Border.all(color: AppColors.lighterBlack),
                    borderRadius: BorderRadius.circular(kCardRadius)),
                child: Padding(
                  padding:
                      EdgeInsets.all(isMobile ? spacingSmall : spacingMedium),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data[index].title,
                          maxLines: 1,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .labelTextStyle
                              .copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.darkBlue)),
                      const SizedBox(height: spacingStandard),
                      Expanded(
                          child: Text(data[index].taskDescription,
                              maxLines: 1,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis)),
                      const SizedBox(height: spacingLarge),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildDate(data[index].dueDate.toString(), context,
                              showDateIcon: true, orangeColor: false),
                          buildStatusChip(data[index].priority.toString())
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget buildViewAllButton(context) {
    return TextButton(
        onPressed: () {},
        child: Text('View all',
            style: Theme.of(context).textTheme.labelTextStyle.copyWith(
                fontWeight: FontWeight.w800, color: AppColors.orange)));
  }

  Widget buildStatusChip(priority) {
    return StatusChip(
        text: getPriorityFromInt(priority).toString(),
        color: getColorFromStatus(priority.toString()));
  }
}
