import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';

import '../../screens/authentication/auhentication_screen.dart';

class LogoutIconWidget extends StatelessWidget {
  const LogoutIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(
              context, AuthenticationScreen.routeName, (route) => false);
        },
        icon: const Icon(Icons.logout_rounded,color: AppColors.errorRed,));
  }
}
