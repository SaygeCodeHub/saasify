import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_theme.dart';
import '../../configs/app_spacing.dart';

class ServiceCard extends StatelessWidget {
  final String cardHeading;
  final IconData iconData;
  final Function onTap;

  const ServiceCard({
    super.key,
    required this.cardHeading,
    required this.iconData,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          onTap();
        },
        child: Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(spacingMedium),
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Icon(iconData),
              const SizedBox(width: spacingMedium),
              Expanded(
                child: Text(cardHeading,
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.fade,
                    style: Theme.of(context)
                        .textTheme
                        .cardMobileHeadingLarge
                        .copyWith(
                            color: AppColors.black,
                            fontWeight: FontWeight.w500)),
              ),
            ]),
          ),
        ));
  }
}
