import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/widgets/text/module_heading.dart';

class HrmsAnnouncementsSection extends StatelessWidget {
  const HrmsAnnouncementsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const ModuleHeading(label: 'Announcements'),
        const SizedBox(height: spacingLarger),
        Container(
          height: MediaQuery.sizeOf(context).height * 0.15,
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.lighterBlack),
              borderRadius: BorderRadius.circular(kCardRadius)),
          child: Padding(
            padding: const EdgeInsets.all(spacingSmall),
            child: ListView.builder(
                itemCount: 2,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.15,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('12:01 am',
                            style: Theme.of(context)
                                .textTheme
                                .cardMobileHeadingTextStyle
                                .copyWith(color: AppColors.orange)),
                        const Text(' : '),
                        const Expanded(
                          child: Text(
                              'Make sure to regularise the attendance by next Monday.Make sure to regularise the attendance by next Monday.',
                              maxLines: 2),
                        )
                      ],
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  }
}
