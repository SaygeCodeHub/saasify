import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';

class CustomTabBar extends StatelessWidget {
  final List<TabData> tabData;

  const CustomTabBar({super.key, required this.tabData});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabData.length,
      child: Column(
        children: [
          TabBar(
              indicatorColor: AppColors.orange,
              labelColor: AppColors.black,
              unselectedLabelColor: Colors.grey,
              labelStyle:
                  const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
              unselectedLabelStyle: const TextStyle(fontSize: 14.0),
              indicatorPadding:
                  const EdgeInsets.symmetric(horizontal: 5.0, vertical: 1.0),
              tabs: tabData.map((e) => e.header).toList()),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(spacingLarger),
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: tabData.map((e) => e.content).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TabData {
  final Widget content;
  final Widget header;
  final String label;
  final IconData? icon;

  TabData({this.icon, this.label = "", required this.content})
      : header = (icon != null)
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: spacingSmall),
                child: Icon(icon, size: 20.0, color: AppColors.darkBlue),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: spacingSmall),
                child: Text(label,
                    style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkBlue)),
              );
}
