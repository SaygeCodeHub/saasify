import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_theme.dart';

class ListTileWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? avatarUrl;

  const ListTileWidget(
      {super.key, required this.title, required this.subtitle, this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: const Icon(Icons.person, color: AppColors.darkBlue, size: 40),
        title:
            Text(title, style: Theme.of(context).textTheme.userNameTextStyle),
        subtitle: Row(
          children: [
            Text('Employee ID - ',
                style: Theme.of(context)
                    .textTheme
                    .statusTextStyle
                    .copyWith(fontWeight: FontWeight.normal, fontSize: 10)),
            Text(subtitle,
                style: Theme.of(context).textTheme.statusTextStyle.copyWith(
                    color: AppColors.darkBlue,
                    fontWeight: FontWeight.w400,
                    fontSize: 10)),
          ],
        ));
  }
}
