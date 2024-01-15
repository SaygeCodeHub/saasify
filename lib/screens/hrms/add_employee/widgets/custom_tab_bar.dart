import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/screens/hrms/add_employee/widgets/employee_basic_details.dart';

import 'employee_document_details.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 5,
      child: Column(
        children: [
          TabBar(
            indicatorColor: AppColors.orange,
            labelColor: AppColors.black,
            unselectedLabelColor: Colors.grey,
            labelStyle: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
            unselectedLabelStyle: TextStyle(fontSize: 14.0),
            indicatorPadding:
                EdgeInsets.symmetric(horizontal: 5.0, vertical: 1.0),
            tabs: [
              Tab(text: 'Personal Info'),
              Tab(text: 'Documents'),
              Tab(text: 'Education & Experience'),
              Tab(text: 'Financial'),
              Tab(text: 'Official'),
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(spacingLarger),
              child: TabBarView(
                children: [
                  EmployeeBasicDetails(),
                  EmployeeDocumentDetails(),
                  Center(child: Text('Content for Tab 3')),
                  Center(child: Text('Content for Tab 3')),
                  Center(child: Text('Content for Tab 2')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
