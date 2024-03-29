import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/authentication/authenticate_user_model.dart';
import 'package:saasify/screens/companies/widgets/companies/select_company_button.dart';

import '../../../../configs/app_colors.dart';
import '../../../../configs/app_spacing.dart';
import '../../../../configs/spacing.dart';

class AllCompaniesMobile extends StatefulWidget {
  final List<Company> companies;

  const AllCompaniesMobile({super.key, required this.companies});

  @override
  State<AllCompaniesMobile> createState() => _AllCompaniesMobileState();
}

class _AllCompaniesMobileState extends State<AllCompaniesMobile> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(spacingStandard),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Hello, Aditya!',
              style: Theme.of(context)
                  .textTheme
                  .headingTextStyle
                  .copyWith(color: AppColors.black)),
          const SizedBox(height: spacingMedium),
          const Text('You have access to the following companies'),
          const SizedBox(height: spacingMedium),
          SizedBox(
            height: 240,
            child: GridView.builder(
              itemCount: widget.companies.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
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
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(spacingLarger),
                              child:
                                  FittedBox(child: Icon(Icons.store_outlined)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(spacingXMedium),
                            child: Text(widget.companies[index].companyName),
                          )
                        ],
                      )),
                );
              },
            ),
          ),
          const SizedBox(height: spacingBetweenTextFieldAndButton),
          SelectCompanyButton(
              companyName: widget.companies[selectedIndex].companyName,
              branches: widget.companies[selectedIndex].branches),
          const SizedBox(height: spacingXXHuge)
        ],
      ),
    );
  }
}
