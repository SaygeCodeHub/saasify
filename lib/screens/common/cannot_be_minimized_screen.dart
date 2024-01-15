import 'package:flutter/material.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/utils/constants/string_constants.dart';

class CannotBeMinimizeScreen extends StatelessWidget {
  const CannotBeMinimizeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(kGeneralButtonHeight),
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  const Icon(Icons.sentiment_dissatisfied_outlined,
                      size: kGeneralButtonHeight),
                  Text(StringConstants.kCannotBeMinimized,
                      style: Theme.of(context).textTheme.xxTiny,
                      textAlign: TextAlign.center)
                ]))));
  }
}
