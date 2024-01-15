import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/employee/employee_bloc.dart';
import 'package:saasify/bloc/employee/employee_event.dart';
import 'package:saasify/bloc/employee/employee_state.dart';
import 'package:saasify/screens/dashboard/dashboard_screen.dart';
import 'package:saasify/screens/settings/add_employee_screen.dart';
import 'package:saasify/utils/responsive.dart';
import '../../configs/app_spacing.dart';
import '../../utils/constants/string_constants.dart';
import '../../widgets/custom_page_header.dart';
import '../../widgets/sidebar.dart';
import '../../widgets/top_bar.dart';
import 'employee_list_data_table.dart';

class EmployeeListScreen extends StatelessWidget {
  static const String routeName = 'EmployeeListScreen';

  static List<int> selectedIds = [];

  EmployeeListScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    context.read<EmployeeBloc>().add(GetEmployees());
    return Scaffold(
        key: _scaffoldKey,
        drawer: const SideBar(selectedIndex: 1),
        body: Flex(
            crossAxisAlignment: CrossAxisAlignment.start,
            direction:
                context.responsive(Axis.vertical, desktop: Axis.horizontal),
            children: [
              context.responsive(
                  TopBar(
                      scaffoldKey: _scaffoldKey,
                      headingText: StringConstants.kDashboard),
                  desktop: const Expanded(
                    child: SideBar(selectedIndex: 1),
                  )),
              Expanded(
                  flex: 5,
                  child: Padding(
                      padding: const EdgeInsets.all(spacingLarge),
                      child: BlocBuilder<EmployeeBloc, EmployeeStates>(
                        builder: (context, state) {
                          if (state is EmployeesLoaded) {
                            return Column(
                              children: [
                                CustomPageHeader(
                                  backIconVisible: true,
                                  titleText: StringConstants.kEmployees,
                                  buttonVisible: true,
                                  buttonTitle: StringConstants.kAddEmployee,
                                  utilityVisible: true,
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(
                                        context, AddEmployeeScreen.routeName);
                                  },
                                  onBack: () {
                                    Navigator.pushReplacementNamed(
                                        context, DashboardsScreen.routeName);
                                  },
                                ),
                                const SizedBox(height: spacingStandard),
                                EmployeeListDataTable(),
                              ],
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      )))
            ]));
  }
}
