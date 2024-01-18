import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/new_app_theme.dart';
import 'package:saasify/screens/hrms/hrms_dashboard_screen.dart';
import '../../configs/spacing.dart';
import '../../utils/constants/string_constants.dart';
import '../../utils/globals.dart';
import '../../widgets/buttons/primary_button.dart';

class AllBranchesScreen extends StatefulWidget {
  final String companyName;
  static const routeName = 'AllBranchesScreen';

  const AllBranchesScreen({super.key, required this.companyName});

  @override
  State<AllBranchesScreen> createState() => _AllBranchesScreenState();
}

class _AllBranchesScreenState extends State<AllBranchesScreen> {
  int selectedIndex = 0;
  List<String> cardData = ["Card 1", "Card 2", "Card 3", "Card 4"];

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < mobileBreakPoint;
    return PopScope(
      canPop: false,
      child: Scaffold(
          body: Align(
              alignment: Alignment.center,
              child: SizedBox(
                width:
                    MediaQuery.sizeOf(context).width * (isMobile ? 0.8 : 0.30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios,
                              color: AppColors.darkBlue),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        Text(widget.companyName,
                            style:
                                Theme.of(context).textTheme.headingTextStyle),
                        const SizedBox(width: spacingMedium),
                      ],
                    ),
                    const SizedBox(height: spacingBetweenTextFieldAndButton),
                    const Text('Please select a branch'),
                    const SizedBox(height: spacingMedium),
                    SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.30,
                        child: ListView.builder(
                          itemCount: cardData.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: Card(
                                    elevation: 1,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: selectedIndex == index
                                              ? AppColors.orange
                                              : Colors.transparent),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: Padding(
                                        padding: const EdgeInsets.all(
                                            spacingSmallest),
                                        child: ListTile(
                                            leading: const Icon(Icons.store,
                                                color: AppColors.darkBlue),
                                            title: Text("ToolkitX$index")))));
                          },
                        )),
                    const SizedBox(height: spacingBetweenTextFieldAndButton),
                    PrimaryButton(
                        buttonTitle: StringConstants.kNext,
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, HRMSDashboardScreen.routeName);
                        })
                  ],
                ),
              ))),
    );
  }
}
