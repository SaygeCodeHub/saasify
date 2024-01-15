import 'package:flutter/material.dart';
import 'package:saasify/screens/hrms/add_employee/widgets/custom_tab_bar.dart';

import '../../../widgets/layoutWidgets/background_card_widget.dart';

class AddEmployeeWeb extends StatelessWidget {
  const AddEmployeeWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return const BackgroundCardWidget(childScreen: CustomTabBar());
  }
}
