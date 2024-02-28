import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/employee/employee_bloc.dart';
import 'package:saasify/bloc/employee/employee_event.dart';
import 'package:saasify/bloc/employee/employee_states.dart';
import 'package:saasify/caches/cache.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/data/models/screenArguments/update_employee_screen_arguments.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/screens/hrms/add_employee/add_employee_screen.dart';
import 'package:saasify/widgets/alertDialogs/error_alert_dialog.dart';
import 'package:saasify/widgets/profile/user_profile_widget.dart';

class WebProfileDropdown extends StatelessWidget {
  const WebProfileDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
        child: BlocListener<EmployeeBloc, EmployeeStates>(
      listener: (context, state) {
        if (state is EmployeeLoaded) {
          state.isProfile
              ? Navigator.pushNamed(context, AddEmployeeScreen.routeName,
                  arguments: UpdateEmployeeScreenArguments(
                      isViewOnly: true, isProfile: true))
              : null;
        }
        if (state is LoadingEmployeeFailed) {
          state.isProfile
              ? showDialog(
                  context: context,
                  builder: (context) {
                    return ErrorAlertDialog(description: state.errorMessage);
                  })
              : null;
        }
      },
      child: DropdownButton2(
          customButton: const UserProfileWidget(),
          items: [
            ...MenuItems.firstItems.map((item) => DropdownMenuItem<MenuItem>(
                value: item, child: MenuItems.buildItem(item)))
          ],
          onChanged: (value) {
            MenuItems.onChanged(context, value!);
          },
          buttonStyleData: ButtonStyleData(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(40))),
          dropdownStyleData: DropdownStyleData(
              width: 160,
              padding: const EdgeInsets.symmetric(vertical: 6),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
              offset: const Offset(40, -4)),
          menuItemStyleData: MenuItemStyleData(customHeights: [
            ...List<double>.filled(MenuItems.firstItems.length, 48)
          ], padding: const EdgeInsets.only(left: 16, right: 16))),
    ));
  }
}

class MenuItem {
  const MenuItem({
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;
}

class MenuItems {
  static const List<MenuItem> firstItems = [edit];

  static const edit = MenuItem(text: 'Edit Profile', icon: Icons.edit);

  static Widget buildItem(MenuItem item) {
    return Row(children: [
      Icon(item.icon, size: 16),
      const SizedBox(width: spacingSmall),
      Expanded(child: Text(item.text))
    ]);
  }

  static void onChanged(BuildContext context, MenuItem item) async {
    String userId = await getIt<Cache>().getUserId();
    switch (item) {
      case MenuItems.edit:
        if (context.mounted) {
          context
              .read<EmployeeBloc>()
              .add(GetEmployee(employeeId: int.parse(userId), isProfile: true));
        }
        break;
    }
  }
}
