import 'package:flutter/material.dart';
import 'package:saasify/configs/new_app_theme.dart';
import 'package:saasify/screens/companies/widgets/branches/select_branches_button.dart';
import '../../../../configs/app_colors.dart';
import '../../../../configs/app_spacing.dart';
import '../../../../configs/spacing.dart';

class AllBranchesMobile extends StatefulWidget {
  final List<String> cardData;
  final String companyName;
  const AllBranchesMobile({super.key, required this.cardData, required this.companyName});

  @override
  State<AllBranchesMobile> createState() => _AllBranchesMobileState();
}

class _AllBranchesMobileState extends State<AllBranchesMobile> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(spacingStandard),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.companyName,
              style: Theme.of(context)
                  .textTheme
                  .headingTextStyle
                  .copyWith(color: AppColors.black)),
          const SizedBox(height: spacingMedium),
          const Text(
              'Here are the branches of this company'),
          const SizedBox(height: spacingMedium),
          SizedBox(
            height: 240,
            child: GridView.builder(
              itemCount: widget.cardData.length,
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0),
              itemBuilder:
                  (BuildContext context, int index) {
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
                          borderRadius:
                          BorderRadius.circular(5.0)),
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        mainAxisAlignment:
                        MainAxisAlignment.start,
                        children: [
                          const Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(
                                  spacingLarger),
                              child: FittedBox(child: Icon(Icons.storefront_outlined)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(
                                spacingXMedium),
                            child: Text(widget.cardData[index]),
                          )
                        ],
                      )),
                );
              },
            ),
          ),
          const SizedBox(
              height: spacingBetweenTextFieldAndButton),
          SelectBranchButton(company: widget.companyName, branch: widget.cardData[selectedIndex]),
          const SizedBox(height: spacingXXHuge)
        ],
      ),
    );
  }
}
