import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/announcemnet/announcement_bloc.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/screens/announcements/add_announcement_screen.dart';
import 'package:saasify/widgets/icons/notification_widget.dart';

class MobileAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isHome;

  const MobileAppBar({super.key, this.isHome = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: spacingSmall),
          child: isHome
              ? PopupMenuButton(
                  itemBuilder: (BuildContext context) {
                    return [
                      // PopupMenuItem(
                      //   onTap: () {
                      //     context.read<TaskBloc>().resetTaskDetails();
                      //     Navigator.pushNamed(context, TaskScreen.routeName);
                      //   },
                      //   child: const Text('Add Task'),
                      // ),
                      PopupMenuItem(
                        onTap: () {
                          context
                              .read<AnnouncementBloc>()
                              .announcementDetails
                              .clear();
                          Navigator.pushNamed(
                              context, AddAnnouncementScreen.routeName);
                        },
                        child: const Text('Add Announcement'),
                      )
                    ];
                  },
                  icon: const Icon(Icons.add, color: AppColors.darkBlue))
              : const SizedBox.shrink(),
        ),
        Padding(
          padding: const EdgeInsets.only(right: spacingSmall),
          child: isHome ? const NotificationWidget() : const SizedBox(),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
