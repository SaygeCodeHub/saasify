import 'package:flutter/material.dart';
import 'package:saasify/configs/new_app_theme.dart';

class UserNameWidget extends StatelessWidget {
  const UserNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Deep', style: Theme.of(context).textTheme.userNameTextStyle);
  }
}
