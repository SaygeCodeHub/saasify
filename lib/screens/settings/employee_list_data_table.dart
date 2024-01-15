import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/employee/employee_bloc.dart';
import 'package:saasify/bloc/employee/employee_event.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/screens/settings/employee_list.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/custom_table.dart';

class EmployeeListDataTable extends StatelessWidget {
  const EmployeeListDataTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomDataTable(
      columnList: const [
        StringConstants.kFirstName,
        StringConstants.kLastName,
        StringConstants.kEmailAddress,
        StringConstants.kMobileNo,
        StringConstants.kType,
        '',
      ],
      selectedIds: EmployeeListScreen.selectedIds,
      dataCount: 4,
      dataIds: List.generate(4, (index) => index),
      onHeaderCheckboxChange: () {
        if (EmployeeListScreen.selectedIds.length < 4) {
          EmployeeListScreen.selectedIds = [0, 1, 2, 3];
        } else {
          EmployeeListScreen.selectedIds.clear();
        }
        context.read<EmployeeBloc>().add(GetEmployees());
      },
      onRowCheckboxChange: (int index) {
        (EmployeeListScreen.selectedIds.contains(index))
            ? EmployeeListScreen.selectedIds.remove(index)
            : EmployeeListScreen.selectedIds.add(index);
        context.read<EmployeeBloc>().add(GetEmployees());
      },
      generateData: (index) {
        return [
          DataCell(Align(
            alignment: Alignment.centerLeft,
            child: Text("Aditya",
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.xxTiniest),
          )),
          DataCell(
            Align(
                alignment: Alignment.centerLeft,
                child: Text("Singh",
                    style: Theme.of(context).textTheme.xxTiniest)),
          ),
          DataCell(
            Align(
                alignment: Alignment.centerLeft,
                child: Text("abc456@gmail.com",
                    style: Theme.of(context).textTheme.xxTiniest)),
          ),
          DataCell(
            Align(
                alignment: Alignment.centerLeft,
                child: Text("8888881800",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.xxTiniest)),
          ),
          DataCell(Align(
            alignment: Alignment.centerLeft,
            child: Text("Owner",
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.xxTiniest),
          )),
          DataCell(IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.edit,
                size: spacingStandard,
              )))
        ];
      },
    );
  }
}
