import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/announcemnet/announcement_bloc.dart';
import 'package:saasify/bloc/task/task_bloc.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/screens/announcements/add_announcement_screen.dart';
import 'package:saasify/screens/task/task_screen.dart';
import 'package:saasify/widgets/app_bar/profile_dropdown.dart';
import 'package:saasify/widgets/icons/notification_widget.dart';
import 'package:saasify/widgets/userInput/change_branch.dart';

class WebAppBar extends StatelessWidget {
  final bool isHome;

  const WebAppBar({super.key, this.isHome = false});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.grey,
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height * 0.065,
        child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: spacingXMedium),
              const ChangeBranch(),
              const Expanded(child: SizedBox()),
              isHome
                  ? PopupMenuButton(
                      splashRadius: 20,
                      padding: EdgeInsets.zero,
                      itemBuilder: (BuildContext context) {
                        return [
                          PopupMenuItem(
                              onTap: () {
                                context.read<TaskBloc>().resetTaskDetails();
                                Navigator.pushNamed(
                                    context, TaskScreen.routeName);
                              },
                              child: const Text('Add Task')),
                          PopupMenuItem(
                              onTap: () {
                                context
                                    .read<AnnouncementBloc>()
                                    .announcementDetails
                                    .clear();
                                Navigator.pushNamed(
                                    context, AddAnnouncementScreen.routeName);
                              },
                              child: const Text('Add Announcement'))
                        ];
                      },
                      icon: const Icon(Icons.add, color: AppColors.darkBlue))
                  : IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.home, color: AppColors.darkBlue)),
              // const NotificationWidget(),
              const SizedBox(width: spacingXMedium),
              const Padding(
                  padding: EdgeInsets.only(right: spacingXXHuge),
                  child: WebProfileDropdown())
            ]));
  }
}
