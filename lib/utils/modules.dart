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
import 'package:saasify/screens/hrms/timesheet/timesheet_attendance_history_screen.dart';

List<ValueCardModel> hrmsFeatures = [
  ValueCardModel(
      cardHeading: Modules.pendingApprovals.name,
      value: '10',
      iconData: FontAwesomeIcons.solidThumbsUp,
      onTap: (BuildContext context) {
        Navigator.pushNamed(context, PendingLeaveRequestScreen.routeName);
      },
      moduleId: 0.1),
  ValueCardModel(
      cardHeading: Modules.totalEmployees.name,
      value: '20',
      iconData: FontAwesomeIcons.person,
      onTap: (BuildContext context) {},
      moduleId: 0.2),
  ValueCardModel(
      cardHeading: Modules.monthlySalaryRollout.name,
      value: 'Rs. 20,000',
      iconData: FontAwesomeIcons.moneyBillTransfer,
      onTap: (BuildContext context) {},
      moduleId: 0.3),
  ValueCardModel(
      cardHeading: Modules.addNewEmployee.name,
      iconData: FontAwesomeIcons.personCirclePlus,
      onTap: (context) {
        showAddEmployeeDialog(context);
      },
      moduleId: 0.4),
  ValueCardModel(
      cardHeading: Modules.viewAllEmployees.name,
      iconData: FontAwesomeIcons.peopleGroup,
      onTap: (context) {
        Navigator.pushNamed(context, EmployeeListScreen.routeName);
      },
      moduleId: 0.5),
  ValueCardModel(
      cardHeading: Modules.applyLeave.name,
      iconData: FontAwesomeIcons.car,
      onTap: (BuildContext context) {
        Navigator.pushNamed(context, ApplyLeaveScreen.routeName);
      },
      moduleId: 0.6),
  ValueCardModel(
      cardHeading: Modules.myLeaves.name,
      iconData: FontAwesomeIcons.hospital,
      onTap: (BuildContext context) {
        Navigator.pushNamed(context, MyLeavesScreen.routeName);
      },
      moduleId: 0.7),
  ValueCardModel(
      cardHeading: Modules.timesheet.name,
      iconData: FontAwesomeIcons.businessTime,
      onTap: (BuildContext context) {
        Navigator.pushNamed(
            context, TimeSheetAttendanceHistoryScreen.routeName);
      },
      moduleId: 0.8)
];
