import 'package:flutter/material.dart';
import 'package:saasify/widgets/primary_button.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/branches/fetch_all_branches_model.dart';
import '../../../utils/constants/string_constants.dart';
import '../../../widgets/custom_page_header.dart';
import '../../dashboard/dashboard_screen.dart';
import 'add_store_popup.dart';
import 'branch_listview.dart';

class BranchGridMobileScreen extends StatelessWidget {
  const BranchGridMobileScreen({
    super.key,
    required this.branchesData,
  });

  final List<BranchesData> branchesData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(spacingLarge),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kCircularRadius),
              boxShadow: const [
                BoxShadow(color: AppColor.saasifyLightPaleGrey, blurRadius: 5.0)
              ],
              color: AppColor.saasifyWhite),
          child: PrimaryButton(
              onPressed: () {
                showDialog(context: context, builder: (ctx) => AddStorePopup());
              },
              buttonTitle: StringConstants.kAddNewBranch),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(spacingLarge),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomPageHeader(
            titleText: StringConstants.kBranches,
            onBack: () {
              Navigator.pushReplacementNamed(
                  context, DashboardsScreen.routeName);
            },
            backIconVisible: true,
            buttonVisible: false,
            textFieldVisible: false,
          ),
          BranchListview(branchesData: branchesData)
        ]),
      ),
    );
  }
}
