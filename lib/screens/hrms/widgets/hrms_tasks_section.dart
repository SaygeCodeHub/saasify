import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/widgets/text/module_heading.dart';

class HrmsTasksSection extends StatelessWidget {
  final bool isMobile;

  const HrmsTasksSection({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const ModuleHeading(label: 'Task Boards'),
            Text('View all',
                style: Theme.of(context).textTheme.labelTextStyle.copyWith(
                    fontWeight: FontWeight.w800, color: AppColors.orange))
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
              childAspectRatio:
                  isMobile ? 1.4 : 1.6 // Aspect ratio of each child
              ),
          itemCount: isMobile ? 2 : 5,
          itemBuilder: (context, index) {
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
                      Text('Submit Documents',
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
                      const Expanded(
                          child: Text('Upload and submit F12 & 1QC Form',
                              maxLines: 1,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis)),
                      const SizedBox(height: spacingLarge),
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.date_range),
                              SizedBox(width: spacingXXSmall),
                              Text('28/12/2024')
                            ],
                          ),
                          Text('High')
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
}
