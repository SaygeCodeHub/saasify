import 'package:flutter/material.dart';

import '../../configs/app_spacing.dart';
import '../../utils/globals.dart';

class MultiFieldRow extends StatelessWidget {
  final List<Widget> childrenWidgets;

  const MultiFieldRow({super.key, required this.childrenWidgets});

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < mobileBreakPoint;
    return Flex(
      direction: isMobile ? Axis.vertical : Axis.horizontal,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
          childrenWidgets.length,
          (index) => !isMobile
              ? Expanded(
                  child: Padding(
                  padding: childrenWidgets.length == 1
                      ? EdgeInsets.zero
                      : index == 0
                          ? const EdgeInsets.only(right: spacingSmall)
                          : index == childrenWidgets.length - 1
                              ? const EdgeInsets.only(left: spacingSmall)
                              : const EdgeInsets.symmetric(
                                  horizontal: spacingSmall),
                  child: childrenWidgets[index],
                ))
              : Padding(
                  padding: index == 0
                      ? const EdgeInsets.only(bottom: spacingSmall)
                      : index == childrenWidgets.length - 1
                          ? const EdgeInsets.only(top: spacingSmall)
                          : const EdgeInsets.symmetric(vertical: spacingSmall),
                  child: childrenWidgets[index],
                )),
    );
  }
}
