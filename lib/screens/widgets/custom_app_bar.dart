import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saasify/configs/app_theme.dart';
import '../../configs/app_spacing.dart';

class CustomAppBar extends StatelessWidget {
  final String? title;

  const CustomAppBar({super.key, this.title = ''});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: spacingHuge),
        InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset("assets/backButton.svg")),
        const SizedBox(height: spacingHuge),
        Padding(
          padding: const EdgeInsets.only(left: spacingSmall),
          child: Text(title!, style: Theme.of(context).textTheme.screenTitle),
        ),
        const SizedBox(height: spacingHuge),
      ],
    );
  }
}
