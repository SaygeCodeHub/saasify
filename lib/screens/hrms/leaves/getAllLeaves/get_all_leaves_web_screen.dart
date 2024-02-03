import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/data/models/leaves/get_all_leaves_model.dart';
import 'package:saasify/screens/hrms/leaves/getAllLeaves/leaves_table_heading.dart';
import 'package:saasify/screens/hrms/leaves/getAllLeaves/my_leaves_table.dart';
import 'package:saasify/screens/hrms/leaves/getAllLeaves/pending_leaves_table.dart';
import 'package:saasify/utils/constants/string_constants.dart';

class GetMyLeavesWebScreen extends StatelessWidget {
  final GetMyLeavesData myLeavesData;
  const GetMyLeavesWebScreen({super.key, required this.myLeavesData});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(spacingMedium),
        child:
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const LeavesTableHeading(title: StringConstants.kPendingLeaves),
          PendingLeavesTable(myLeavesData: myLeavesData),
          const LeavesTableHeading(title: StringConstants.kMyLeaves),
          MyLeavesTable(myLeavesData: myLeavesData)
        ]));
  }
}