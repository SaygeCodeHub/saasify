import 'package:flutter/material.dart';

import '../../configs/app_spacing.dart';
import '../../utils/globals.dart';

class FieldContainer extends StatelessWidget {
  final List<RowField> childrenWidgets;

  const FieldContainer({super.key, required this.childrenWidgets});

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
                  flex: childrenWidgets[index].flex,
                  child: Padding(
                    padding: childrenWidgets.length == 1
                        ? EdgeInsets.zero
                        : index == 0
                            ? const EdgeInsets.only(right: spacingSmall)
                            : index == childrenWidgets.length - 1
                                ? const EdgeInsets.only(left: spacingSmall)
                                : const EdgeInsets.symmetric(
                                    horizontal: spacingSmall),
                    child: childrenWidgets[index].widget,
                  ))
              : Padding(
                  padding: index == 0
                      ? const EdgeInsets.only(bottom: spacingSmall)
                      : index == childrenWidgets.length - 1
                          ? const EdgeInsets.only(top: spacingSmall)
                          : const EdgeInsets.symmetric(vertical: spacingSmall),
                  child: childrenWidgets[index].widget,
                )),
    );
  }
}

class RowField {
  final int flex;
  final Widget widget;

  const RowField({this.flex = 1, required this.widget});
}
