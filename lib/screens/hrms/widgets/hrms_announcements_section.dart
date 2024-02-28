import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/initialise/initialise_bloc.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/screens/announcements/all_announcements_screen.dart';
import 'package:saasify/screens/announcements/widgets/announcements_widget_utils.dart';
import 'package:saasify/widgets/text/module_heading.dart';

class HrmsAnnouncementsSection extends StatelessWidget {
  final bool isMobile;

  const HrmsAnnouncementsSection({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    var data = context
        .read<InitialiseAppBloc>()
        .initialiseAppModel!
        .data!
        .announcements!;
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const ModuleHeading(label: 'Announcements'),
            InkWell(
                onTap: () {
                  Navigator.pushNamed(
                      context, AllAnnouncementsScreen.routeName);
                },
                child: Text('View all',
                    style: Theme.of(context).textTheme.labelTextStyle.copyWith(
                        fontWeight: FontWeight.w800, color: AppColors.orange)))
          ]),
          const SizedBox(height: spacingLarger),
          Container(
              height: MediaQuery.sizeOf(context).height * 0.20,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.lighterBlack),
                  borderRadius: BorderRadius.circular(kCardRadius)),
              child: Padding(
                  padding: const EdgeInsets.all(spacingSmall),
                  child: data.isEmpty
                      ? buildEmptyAnnouncements(context)
                      : ListView.builder(
                          itemCount: data.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return buildAnnouncementItem(
                                context,
                                data[index].dueDate.toString(),
                                data[index].description);
                          })))
        ]);
  }
}
