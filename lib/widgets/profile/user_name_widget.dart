import 'package:flutter/material.dart';
import 'package:saasify/caches/cache.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/di/app_module.dart';

class UserNameWidget extends StatelessWidget {
  const UserNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getIt<Cache>().getUserName(),
        builder: (context, snapshot) {
          return Text(snapshot.data.toString(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.userNameTextStyle);
        });
  }
}
