import 'package:flutter/material.dart';

class EmployeeListMobile extends StatelessWidget {
  const EmployeeListMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return Card(
          child: ListTile(
              title: Text('Employee Name'),
              subtitle: Text('Employee Designation'),
              trailing: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {}
              )
          )
      );
    }
    );
  }
}
