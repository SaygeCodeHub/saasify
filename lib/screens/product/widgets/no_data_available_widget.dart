import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';
import '../../../configs/app_color.dart';
import '../../../utils/constants/string_constants.dart';

class NoDataAvailableWidget extends StatelessWidget {
  const NoDataAvailableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(StringConstants.kNoDataAvailable,
            style: Theme.of(context)
                .textTheme
                .tinier
                .copyWith(color: AppColor.saasifyLightGrey)));
  }
}
