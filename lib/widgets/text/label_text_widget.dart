import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';

class LabelTextWidget extends StatelessWidget {
  final String? label;

  const LabelTextWidget({super.key, this.label});

  @override
  Widget build(BuildContext context) {
    return Text(label!,
        style: Theme.of(context).textTheme.labelTextStyle,
        maxLines: 1,
        overflow: TextOverflow.fade,
        softWrap: false);
  }
}
