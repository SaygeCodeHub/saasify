import 'package:flutter/material.dart';
import 'package:saasify/configs/new_app_theme.dart';

class ModuleHeading extends StatelessWidget {
  final String? label;

  const ModuleHeading({super.key, this.label});

  @override
  Widget build(BuildContext context) {
    return Text(label!,
        style: Theme.of(context).textTheme.moduleHeadingTextStyle);
  }
}
