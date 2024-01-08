import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/onboarding/onboarding_bloc.dart';
import 'package:saasify/bloc/onboarding/onboarding_event.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/authentication/authentication_model.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_colors.dart';
import '../../../configs/app_spacing.dart';

class CompaniesGridView extends StatelessWidget {
  final int selectedCompanyIndex;
  final bool isFromMobile;
  final List<Company> companyList;

  const CompaniesGridView({
    super.key,
    required this.companyList,
    required this.selectedCompanyIndex,
    required this.isFromMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: (isFromMobile == true) ? 2 : 4,
                childAspectRatio: 1,
                crossAxisSpacing: spacingLarge,
                mainAxisSpacing: spacingLarge),
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: companyList.length,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    context
                        .read<OnboardingBloc>()
                        .add(SelectCompany(companyIndex: index));
                  },
                  child: Container(
                      height: kCompaniesGridContainerHeight,
                      padding: const EdgeInsets.all(spacingSmall),
                      decoration: BoxDecoration(
                          color: AppColors.lightGrey,
                          border: Border.all(
                              width: 2,
                              color: (selectedCompanyIndex == index)
                                  ? AppColors.orange
                                  : AppColor.saasifyPaleGrey),
                          borderRadius: BorderRadius.circular(kCircularRadius)),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Image.network(
                                    companyList[index].companyLogo,
                                    fit: BoxFit.cover)),
                            const SizedBox(height: spacingXXSmall),
                            Text(companyList[index].companyName,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .xTiniest
                                    .copyWith(fontWeight: FontWeight.w600))
                          ])));
            }));
  }
}
