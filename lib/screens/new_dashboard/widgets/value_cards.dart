import 'package:flutter/material.dart';
import 'package:saasify/configs/new_app_theme.dart';
import '../../../configs/app_spacing.dart';
import '../../../utils/globals.dart';

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
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.12,
      child: InkWell(
        onTap: () {
          onTap();
        },
        child: Card(
          elevation: 1.0, // Adjust as needed
          child: Padding(
            padding: const EdgeInsets.all(spacingXXSmall),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(spacingXXSmall),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: isMobile
                              ? MediaQuery.sizeOf(context).width * 0.2
                              : MediaQuery.sizeOf(context).width * 0.05,
                          child: Text(cardHeading, maxLines: 2)),
                      const SizedBox(height: spacingSmall),
                      Text(value.toString(),
                          style: isMobile
                              ? Theme.of(context)
                                  .textTheme
                                  .cardMobileValueTextStyle
                              : Theme.of(context)
                                  .textTheme
                                  .cardMobileValueTextStyle
                                  .copyWith(fontSize: 24))
                    ],
                  ),
                ),
                Flexible(
                  child: Image.asset(iconPath,
                      fit: BoxFit.cover,
                      height: isMobile ? 20 : 60,
                      width: isMobile ? 20 : 60),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
