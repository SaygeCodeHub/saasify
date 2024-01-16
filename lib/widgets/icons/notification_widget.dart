import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {},
        icon: const Icon(Icons.notifications_none_outlined,
            color: AppColors.orange));
  }
}
