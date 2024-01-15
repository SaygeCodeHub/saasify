import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';

class CustomTabBar extends StatelessWidget {
  final List<TabData> tabData;
  const CustomTabBar({super.key, required this.tabData});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
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
              tabs: tabData.map((e) => Tab(text: e.label)).toList()),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(spacingLarger),
              child: TabBarView(
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
  final String label;
  final Widget content;

  TabData({required this.label, required this.content});
}
