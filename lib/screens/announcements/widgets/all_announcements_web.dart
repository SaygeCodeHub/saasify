import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/data/models/announcement/get_all_announcements_model.dart';
import 'package:saasify/screens/announcements/widgets/announcement_details_popup.dart';
import 'package:saasify/screens/hrms/widgets/build_date.dart';

class AllAnnouncementDesktop extends StatelessWidget {
  final List<Announcement> data;

  const AllAnnouncementDesktop({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(spacingLarge),
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 3.5,
              crossAxisSpacing: spacingMedium,
              mainAxisSpacing: spacingMedium),
          shrinkWrap: true,
          itemCount: data.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AnnouncementDetailsPopup(data: data[index]);
                    });
              },
              child: Container(
                padding: const EdgeInsets.all(spacingStandard),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.lighterBlack),
                    borderRadius: BorderRadius.circular(kCardRadius)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      buildDate(data[index].dueDate.toString(), context,
                          showDateIcon: true),
                      const SizedBox(height: spacingSmall),
                      Expanded(
                          child: Text(data[index].description,
                              maxLines: 2, overflow: TextOverflow.ellipsis))
                    ]),
              ),
            );
          }),
    );
  }
}
