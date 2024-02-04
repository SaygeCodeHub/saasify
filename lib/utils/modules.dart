import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saasify/data/enums/modules_enum.dart';
import 'package:saasify/data/models/generalModels/value_card_model.dart';
import 'package:saasify/screens/hrms/add_employee/widgets/add_emp_dialouge.dart';
import 'package:saasify/screens/hrms/employee_list/employee_list_screen.dart';
import 'package:saasify/screens/hrms/leaves/applyLeave/apply_leave_screen.dart';
import 'package:saasify/screens/hrms/leaves/getMyLeaves/my_leaves_screen.dart';
import 'package:saasify/screens/hrms/leaves/pendingLeaveRequest/pending_leave_request_screen.dart';

List<ValueCardModel> statisticsModules = [
  ValueCardModel(
      cardHeading: Modules.pendingLeaveApprovals.name,
      value: '10',
      iconData: FontAwesomeIcons.solidThumbsUp,
      onTap: (BuildContext context) {
        Navigator.pushNamed(context, PendingLeaveRequestScreen.routeName);
      }),
  ValueCardModel(
      cardHeading: Modules.todaysAbsentees.name,
      value: '3',
      iconData: FontAwesomeIcons.ban,
      onTap: (BuildContext context) {}),
  ValueCardModel(
      cardHeading: Modules.totalEmployees.name,
      value: '20',
      iconData: Icons.people_alt,
      onTap: (BuildContext context) {}),
  ValueCardModel(
      cardHeading: Modules.monthlySalaryRollout.name,
      value: 'Rs. 20,000',
      iconData: FontAwesomeIcons.moneyBillTransfer,
      onTap: (BuildContext context) {}),
];
List<ValueCardModel> hrmsModules = [
  ValueCardModel(
      cardHeading: Modules.addNewEmployee.name,
      iconData: Icons.person_add_alt_1_rounded,
      onTap: (context) {
        showAddEmployeeDialog(context);
      }),
  ValueCardModel(
      cardHeading: Modules.viewAllEmployees.name,
      iconData: Icons.people_alt,
      onTap: (context) {
        Navigator.pushNamed(context, EmployeeListScreen.routeName);
      }),
  ValueCardModel(
      cardHeading: Modules.applyLeave.name,
      iconData: FontAwesomeIcons.car,
      onTap: (BuildContext context) {
        Navigator.pushNamed(context, ApplyLeaveScreen.routeName);
      }),
  ValueCardModel(
      cardHeading: Modules.myLeaves.name,
      iconData: Icons.volunteer_activism_sharp,
      onTap: (BuildContext context) {
        Navigator.pushNamed(context, MyLeavesScreen.routeName);
      }),
  ValueCardModel(
      cardHeading: Modules.timesheet.name,
      iconData: Icons.insert_page_break_rounded,
      onTap: (BuildContext context) {})
];
