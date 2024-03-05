import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';

import '../../configs/app_colors.dart';
import '../../configs/app_spacing.dart';

class CustomRadioListTile extends StatelessWidget {
  final String? label;
  final String value;
  final String? groupValue;
  final void Function(String?) onChanged;
  final Widget? title;
  final Widget? subtitle;
  final EdgeInsetsGeometry? contentPadding;
  final bool selected;
  final Color? activeColor;
  final Color? tileColor;
  final bool dense;
  final Widget? secondary;
  final MouseCursor? mouseCursor;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;

  const CustomRadioListTile({
    super.key,
    required this.value,
    this.groupValue,
    required this.onChanged,
    this.title,
    this.subtitle,
    this.contentPadding,
    this.selected = false,
    this.activeColor,
    this.tileColor,
    this.dense = false,
    this.secondary,
    this.mouseCursor,
    this.label,
    this.titleStyle,
    this.subtitleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (label != null)
          Text(label!, style: Theme.of(context).textTheme.subDetailTextStyle),
        if (label != null) const SizedBox(height: spacingSmall),
        RadioListTile<String>(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
          title: title != null
              ? DefaultTextStyle(
                  style: titleStyle ??
                      Theme.of(context).textTheme.subDetailTextStyle,
                  child: title!)
              : null,
          subtitle: subtitle,
          contentPadding: contentPadding,
          selected: selected,
          activeColor: AppColors.orange,
          tileColor: tileColor,
          dense: dense,
          secondary: secondary,
          mouseCursor: mouseCursor,
        ),
      ],
    );
  }
}
