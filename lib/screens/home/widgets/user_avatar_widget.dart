import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';

class UserAvatarWidget extends StatelessWidget {
  const UserAvatarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'Hi Ashish,',
          style: Theme.of(context).textTheme.moduleHeadingTextStyle,
        ),
      ],
    );
  }
}
