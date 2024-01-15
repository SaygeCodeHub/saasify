import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/new_app_theme.dart';
import 'package:saasify/screens/companies/all_branches_screen.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import '../../configs/spacing.dart';
import '../../widgets/buttons/primary_button.dart';

class AllCompaniesScreen extends StatefulWidget {
  static const routeName = 'AllCompaniesScreen';

  const AllCompaniesScreen({super.key});

  @override
  State<AllCompaniesScreen> createState() => _AllCompaniesScreenState();
}

class _AllCompaniesScreenState extends State<AllCompaniesScreen> {
  int selectedIndex = 0;
  List<String> cardData = ["Card 1", "Card 2", "Card 3", "Card 4"];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
          body: Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.30,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Welcome,',
                        style: Theme.of(context).textTheme.headingTextStyle),
                    const SizedBox(height: spacingBetweenTextFieldAndButton),
                    const Text('You have access to the following companies'),
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
                          Navigator.pushNamed(
                              context, AllBranchesScreen.routeName);
                        })
                  ],
                ),
              ))),
    );
  }
}
