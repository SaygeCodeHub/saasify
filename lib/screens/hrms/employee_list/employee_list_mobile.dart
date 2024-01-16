import 'package:flutter/material.dart';

class EmployeeListMobile extends StatelessWidget {
  const EmployeeListMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return Card(
          child: ListTile(
              title: const Text('Employee Name'),
              subtitle: const Text('Employee Designation'),
              trailing: IconButton(icon: const Icon(Icons.edit), onPressed: () {})));
    });
  }
}
