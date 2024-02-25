import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/task/task_bloc.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/screens/task/task_screen.dart';
import 'package:saasify/widgets/app_bar/profile_dropdown.dart';
import '../../configs/app_colors.dart';
import '../userInput/change_branch.dart';
import '../icons/notification_widget.dart';

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
          Padding(
            padding: const EdgeInsets.only(right: spacingSmall),
            child: isHome
                ? IconButton(
                    onPressed: () {
                      context.read<TaskBloc>().resetTaskDetails();
                      Navigator.pushNamed(context, TaskScreen.routeName);
                    },
                    icon: const Icon(Icons.add, color: AppColors.darkBlue))
                : IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.home, color: AppColors.darkBlue)),
          ),
          const SizedBox(width: spacingXMedium),
          const NotificationWidget(),
          const SizedBox(width: spacingXMedium),
          const Padding(
            padding: EdgeInsets.only(right: spacingXXHuge),
            child: WebProfileDropdown(),
          )
        ],
      ),
    );
  }
}
