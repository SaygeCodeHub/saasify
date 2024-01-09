import 'package:flutter/material.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/branches/fetch_all_branches_model.dart';
import '../../../utils/constants/string_constants.dart';
import '../../../widgets/custom_page_header.dart';
import '../../dashboard/dashboard_screen.dart';
import 'add_store_popup.dart';
import 'branches_grid.dart';

class BranchGridWebScreen extends StatelessWidget {
  const BranchGridWebScreen({
    super.key,
    required this.branchesData,
  });

  final List<BranchesData> branchesData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          right: spacingXHuge,
          top: spacingXMedium,
          left: kBranchLeftPadding,
          bottom: spacingXHuge),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CustomPageHeader(
          titleText: StringConstants.kBranches,
          onBack: () {
            Navigator.pushReplacementNamed(context, DashboardsScreen.routeName);
          },
          backIconVisible: true,
          buttonTitle: StringConstants.kAddNewBranch,
          buttonVisible: true,
          textFieldVisible: false,
          onPressed: () {
            showDialog(context: context, builder: (ctx) => AddStorePopup());
          },
        ),
        const SizedBox(height: spacingStandard),
        BranchesGrid(branchesData: branchesData)
      ]),
    );
  }
}
