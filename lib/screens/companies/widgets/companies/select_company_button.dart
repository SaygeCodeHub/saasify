import 'package:flutter/material.dart';

import '../../../../utils/constants/string_constants.dart';
import '../../../../widgets/buttons/primary_button.dart';
import '../../all_branches_screen.dart';

class SelectCompanyButton extends StatelessWidget {
  const SelectCompanyButton({
    super.key, required this.company
  });

  final String company;

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
        buttonTitle: StringConstants.kNext,
        onPressed: () {
          Navigator.pushNamed(
              context, AllBranchesScreen.routeName,
              arguments: company);
        });
  }
}