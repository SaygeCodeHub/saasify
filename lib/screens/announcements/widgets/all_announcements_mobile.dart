import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/data/models/announcement/get_all_announcements_model.dart';
import 'package:saasify/screens/announcements/widgets/announcement_details_screen.dart';
import 'package:saasify/screens/hrms/widgets/build_date.dart';

class AllAnnouncementMobile extends StatelessWidget {
  final List<Announcement> data;

  const AllAnnouncementMobile({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: data.length,
        shrinkWrap: true,
        separatorBuilder: (context, index) =>
            const SizedBox(height: spacingSmall),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          AnnouncementDetailsScreen(data: data[index])));
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
                    Text(data[index].description, maxLines: 3)
                  ]),
            ),
          );
        });
  }
}
