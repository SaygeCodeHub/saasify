import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';

class ModuleHeading extends StatelessWidget {
  final bool? isFormScreen;
  final String? label;

  const ModuleHeading({super.key, this.label, this.isFormScreen = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        (isFormScreen!)
            ? IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new_outlined))
            : const SizedBox.shrink(),
        SizedBox(width: (isFormScreen!) ? spacingMedium : 0.0 ),
        Text(label!, style: Theme.of(context).textTheme.moduleHeadingTextStyle),
      ],
    );
  }
}
