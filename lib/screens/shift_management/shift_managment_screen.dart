import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/screens/shift_management/widgets/calendar_widget.dart';
import 'package:saasify/screens/shift_management/widgets/employee_shift_tile.dart';
import 'package:saasify/widgets/layoutWidgets/screen_skeleton.dart';
import '../../widgets/text/module_heading.dart';

class ShiftManagementScreen extends StatefulWidget {
  static const routeName = 'ShiftManagementScreen';

  const ShiftManagementScreen({super.key});

  @override
  State<ShiftManagementScreen> createState() => _ShiftManagementScreenState();
}

class _ShiftManagementScreenState extends State<ShiftManagementScreen>
    with SingleTickerProviderStateMixin {
  late TextEditingController searchController = TextEditingController();
  late TabController tabController = TabController(length: 3, vsync: this);

  @override
  Widget build(BuildContext context) {
    return ScreenSkeleton(
      childScreenBuilder: (isMobile) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(spacingStandard),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ModuleHeading(
                    isFormScreen: true, label: "Roaster / Shift Management"),
                const SizedBox(height: spacingStandard),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.825,
                        child: Column(
                          children: [
                            const SizedBox(height: spacingXXSmall),
                            TextField(
                                controller: searchController,
                                decoration: const InputDecoration(
                                  suffixIcon: Icon(Icons.search),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black12)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black12)),
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black12)),
                                  disabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black12)),
                                ),
                                onChanged: (value) {}),
                            const SizedBox(height: spacingStandard),
                            TabBar(
                              controller: tabController,
                              indicatorColor: AppColors.orange,
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .labelTextStyle
                                  .copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.darkBlue),
                              tabs: const [
                                Tab(text: 'Morning'),
                                Tab(text: 'Evening'),
                                Tab(text: 'Night'),
                              ],
                            ),
                            const SizedBox(height: spacingStandard),
                            Expanded(
                              child: TabBarView(
                                controller: tabController,
                                children: [
                                  _buildEmployeeShiftList(8),
                                  _buildEmployeeShiftList(20),
                                  _buildEmployeeShiftList(4)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: spacingStandard),
                    const Expanded(
                      flex: 5,
                      child: Card(
                        child: Padding(
                            padding: EdgeInsets.all(spacingSmall),
                            child: CalendarWidget()),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    searchController.dispose();
    super.dispose();
  }

  Widget _buildEmployeeShiftList(int itemCount) {
    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return const EmployeeShiftTile();
      },
    );
  }
}
