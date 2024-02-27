import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/announcemnet/announcement_bloc.dart';
import 'package:saasify/bloc/announcemnet/announcement_event.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/announcement/get_all_announcements_model.dart';
import 'package:saasify/screens/announcements/add_announcement_screen.dart';
import 'package:saasify/screens/hrms/widgets/build_date.dart';
import 'package:saasify/widgets/buttons/primary_button.dart';

Widget buildEmptyAnnouncements(context) {
  return Center(
      child: Text('No Announcements',
          style: Theme.of(context).textTheme.labelTextStyle.copyWith(
              fontWeight: FontWeight.w500, color: AppColors.darkGrey)));
}

Widget buildAnnouncementItem(context, date, description) {
  return Padding(
      padding: const EdgeInsets.all(spacingSmall),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 78, child: buildDate(date, context)),
            const Text(' : '),
            Expanded(child: Text(description, maxLines: 2))
          ]));
}

List<Widget> getAnnouncementsActions(BuildContext context,
    GlobalKey<FormState> updateKey, Announcement announcement) {
  return [
    PrimaryButton(
        buttonWidth: kGeneralActionButtonWidth,
        backgroundColor: AppColors.errorRed,
        onPressed: () {
          context
              .read<AnnouncementBloc>()
              .add(DeleteAnnouncement(id: announcement.id));
        },
        buttonTitle: "Delete"),
    PrimaryButton(
        buttonWidth: kGeneralActionButtonWidth,
        backgroundColor: AppColors.darkBlue,
        onPressed: () {
          context.read<AnnouncementBloc>().setAnnouncementDetails(announcement);
          Navigator.pushNamed(context, AddAnnouncementScreen.routeName,
                  arguments: true)
              .whenComplete(() {
            context.read<AnnouncementBloc>().add(GetAllAnnouncements());
            Navigator.pop(context);
          });
        },
        buttonTitle: "Edit")
  ];
}
