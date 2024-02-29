import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/announcemnet/announcement_bloc.dart';
import 'package:saasify/bloc/announcemnet/announcement_event.dart';
import 'package:saasify/bloc/announcemnet/announcement_state.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/data/models/announcement/get_all_announcements_model.dart';
import 'package:saasify/screens/announcements/widgets/announcements_widget_utils.dart';
import 'package:saasify/screens/hrms/widgets/build_date.dart';
import 'package:saasify/utils/progress_bar.dart';
import 'package:saasify/widgets/actions/detailsPopUp.dart';
import 'package:saasify/widgets/actions/details_screen.dart';
import 'package:saasify/widgets/alertDialogs/error_alert_dialog.dart';
import 'package:saasify/widgets/alertDialogs/success_alert_dialog.dart';

class AnnouncementDetailsScreen extends StatelessWidget {
  const AnnouncementDetailsScreen({
    super.key,
    required this.data,
  });

  final Announcement data;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AnnouncementBloc, AnnouncementStates>(
      listener: (context, state) {
        if (state is DeletingAnnouncement) {
          ProgressBar.show(context);
        }
        if (state is ErrorDeletingAnnouncement) {
          ProgressBar.dismiss(context);
          showDialog(
              context: context,
              builder: (context) =>
                  ErrorAlertDialog(description: state.errorMessage));
        }
        if (state is AnnouncementDeleted) {
          ProgressBar.dismiss(context);
          context.read<AnnouncementBloc>().add(GetAllAnnouncements());
          showDialog(
              context: context,
              builder: (context) => SuccessAlertDialog(
                  description: "Announcement Deleted Successfully",
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  }));
        }
      },
      child: DetailsScreen(
          title: "Announcement",
          actionsBuilder: (commentsKey) {
            return getAnnouncementsActions(context, commentsKey, data);
          },
          details: [
            buildDate(data.dueDate.toString(), context,
                showDateIcon: true, orangeColor: false),
            const SizedBox(height: spacingLarge),
            Expanded(
                child: DetailsField(
                    data: data.description, title: "Description", maxLines: 5)),
          ],
          showComments: false,
          commentsRequired: false),
    );
  }
}
