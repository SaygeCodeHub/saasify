import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/authentication/authenticate_user_model.dart';
import 'package:saasify/screens/companies/widgets/branches/select_branches_button.dart';
import '../../../../configs/app_colors.dart';
import '../../../../configs/app_spacing.dart';
import '../../../../configs/spacing.dart';

class AllBranchesWeb extends StatefulWidget {
  final List<Branch> branches;
  final String companyName;

  const AllBranchesWeb(
      {super.key, required this.branches, required this.companyName});

  @override
  State<AllBranchesWeb> createState() => _AllBranchesWebState();
}

class _AllBranchesWebState extends State<AllBranchesWeb> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(spacingBetweenTextFieldAndButton),
        child: Container(
          height: MediaQuery.sizeOf(context).height * 0.80,
          width: MediaQuery.sizeOf(context).width * 0.60,
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.grey, width: 5.0)),
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.18,
                child: SizedBox(
                    height: MediaQuery.sizeOf(context).height,
                    child:
                        Image.asset('assets/abstract.png', fit: BoxFit.fill)),
              ),
              const VerticalDivider(),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.all(spacingBetweenTextFieldAndButton),
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
                      const Text('This Branch has following companies'),
                      const SizedBox(height: spacingMedium),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.30,
                        child: Scrollbar(
                          child: GridView.builder(
                            itemCount: widget.branches.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                    crossAxisSpacing: 8.0,
                                    mainAxisSpacing: 8.0),
                            itemBuilder: (BuildContext context, int index) {
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
                                        const Padding(
                                          padding:
                                              EdgeInsets.all(spacingXXSmall),
                                          child: Icon(Icons.store),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(
                                              spacingXMedium),
                                          child: Text(widget
                                              .branches[index].branchName),
                                        )
                                      ],
                                    )),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: spacingBetweenTextFieldAndButton),
                      SelectBranchButton(
                          selectedBranchId: widget
                              .branches[selectedIndex].branchId
                              .toString(),
                          roles: widget.branches[selectedIndex].roles),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
