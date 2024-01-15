import 'package:flutter/cupertino.dart';

import '../configs/app_color.dart';

class ToggleSwitchWidget extends StatelessWidget {
  final Color? activeColor;
  final bool value;
  final void Function(bool)? onChanged;

  const ToggleSwitchWidget(
      {super.key,
      this.activeColor,
      required this.value,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
        scale: 0.65,
        child: CupertinoSwitch(
            value: value,
            onChanged: onChanged,
            activeColor: AppColor.saasifyLightDeepBlue));
  }
}
