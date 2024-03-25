import 'package:flutter/material.dart';
import '../configs/app_dimensions.dart';
import '../utils/global.dart';
import 'widgets/custom_app_bar.dart';

class SkeletonScreen extends StatelessWidget {
  final String appBarTitle;
  final List<Widget> bottomBarButtons;
  final Widget bodyContent;

  const SkeletonScreen({
    super.key,
    required this.appBarTitle,
    required this.bottomBarButtons,
    required this.bodyContent,
  });

  @override
  Widget build(BuildContext context) {
    final double padding = isMobile ? mobileBodyPadding : webBodyPadding;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(title: appBarTitle),
            Expanded(child: Padding(
              padding: const EdgeInsets.only(left:12),
              child: bodyContent,
            )),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(padding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: bottomBarButtons.map((button) {
            return Expanded(child: button);
          }).toList(),
        ),
      ),
    );
  }
}
