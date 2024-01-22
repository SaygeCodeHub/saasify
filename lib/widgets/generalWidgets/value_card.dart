import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/new_app_theme.dart';
import '../../configs/app_spacing.dart';
import '../../utils/globals.dart';

class ValueCard extends StatelessWidget {
  final String cardHeading;
  final String? value;
  final String iconPath;
  final Function onTap;

  const ValueCard({
    super.key,
    required this.cardHeading,
    this.value = '',
    required this.iconPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < mobileBreakPoint;
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(isMobile ? spacingSmall : spacingMedium),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(
              child: Image.asset(iconPath, fit: BoxFit.cover),
            ),
            const SizedBox(height: spacingSmall),
            Text(cardHeading,
                softWrap: false,
                maxLines: 1,
                overflow: TextOverflow.fade,
                style: Theme.of(context)
                    .textTheme
                    .cardMobileHeadingTextStyle
                    .copyWith(color: AppColors.darkBlue)),
            const SizedBox(height: spacingXSmall),
            Text(value ?? '',
                textScaler: TextScaler.linear(isMobile ? 1 : 1.3),
                style: Theme.of(context)
                    .textTheme
                    .cardMobileValueTextStyle
                    .copyWith(color: AppColors.orange))
          ]),
        ),
      ),
    );
  }
}
