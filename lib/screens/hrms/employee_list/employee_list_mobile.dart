import 'package:flutter/material.dart';
import 'package:saasify/data/models/employee/get_all_employees_model.dart';
import 'package:saasify/widgets/list_tile_widget.dart';

class EmployeeListMobile extends StatelessWidget {
  final List<EmployeeDatum> employees;
  const EmployeeListMobile({super.key, required this.employees});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
              itemCount: employees.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                return ListTileWidget(
                    title: employees[index].name,
                    subtitle: employees[index].userEmail,
                    avatarUrl: "https://picsum.photos/200");
              }),
        ),
      ],
    );
  }
}
