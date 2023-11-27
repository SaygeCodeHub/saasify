import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/categories/categories_bloc.dart';
import 'package:saasify/bloc/categories/categories_event.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/utils/responsive.dart';
import '../../configs/app_color.dart';
import '../../configs/app_dimensions.dart';
import '../../configs/app_spacing.dart';
import '../../utils/constants/string_constants.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/sidebar.dart';
import '../../widgets/top_bar.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = 'ProfileScreen';

  ProfileScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    context.read<CategoriesBloc>().add(FetchAllCategories());

    return Scaffold(
        key: _scaffoldKey,
        drawer: const SideBar(selectedIndex: 4),
        body: Flex(
            direction:
                context.responsive(Axis.vertical, desktop: Axis.horizontal),
            children: [
              context.responsive(
                  TopBar(
                      scaffoldKey: _scaffoldKey,
                      headingText: StringConstants.kProfile),
                  desktop: const Expanded(child: SideBar(selectedIndex: 4))),
              Expanded(
                  flex: 5,
                  child: Padding(
                      padding: const EdgeInsets.all(spacingXHuge),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(children: [
                              context.responsive(const SizedBox(),
                                  desktop: Text(StringConstants.kProfile,
                                      style: Theme.of(context)
                                          .textTheme
                                          .xxTiny
                                          .copyWith(
                                              fontWeight: FontWeight.w700))),
                              context.responsive(const SizedBox(),
                                  desktop: const Spacer()),
                              const Spacer(),
                              SizedBox(
                                  width: kGeneralActionButtonWidth,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 30),
                                    child: PrimaryButton(
                                        onPressed: () {},
                                        buttonTitle:
                                            StringConstants.kAddProfile),
                                  ))
                            ]),
                            const SizedBox(height: spacingStandard),
                            Text(StringConstants.kBrandLogo,
                                style: Theme.of(context)
                                    .textTheme
                                    .xxTiniest
                                    .copyWith(fontWeight: FontWeight.w700)),
                            const SizedBox(height: spacingXMedium),
                            Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                  color: AppColor.saasifyLighterGrey,
                                  borderRadius:
                                      BorderRadius.circular(kCircularRadius)),
                              child: Padding(
                                  padding:
                                      const EdgeInsets.all(spacingStandard),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Align(
                                            alignment: Alignment.topRight,
                                            child: Icon(Icons.close)),
                                        const SizedBox(height: spacingSmall),
                                        const Icon(Icons.add_a_photo_outlined),
                                        const SizedBox(height: spacingSmall),
                                        Text("Select a file",
                                            style: Theme.of(context)
                                                .textTheme
                                                .xxTiniest),
                                      ])),
                            ),
                            const SizedBox(height: spacingStandard),
                            Padding(
                                padding: const EdgeInsets.only(right: 30),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                            Text(StringConstants.kBrandName,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .xxTiniest
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w700)),
                                            const SizedBox(
                                                height: spacingSmall),
                                            CustomTextField(
                                                onTextFieldChanged: (value) {}),
                                            const SizedBox(
                                                height: spacingStandard),
                                            Text(StringConstants.kFirstName,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .xxTiniest
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w700)),
                                            const SizedBox(
                                                height: spacingSmall),
                                            CustomTextField(
                                                onTextFieldChanged: (value) {}),
                                            const SizedBox(
                                                height: spacingStandard),
                                            Text(StringConstants.kAddress,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .xxTiniest
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w700)),
                                            const SizedBox(
                                                height: spacingSmall),
                                            CustomTextField(
                                                onTextFieldChanged: (value) {}),
                                            const SizedBox(
                                                height: spacingStandard),
                                            Text(StringConstants.kPassword,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .xxTiniest
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w700)),
                                            const SizedBox(
                                                height: spacingSmall),
                                            CustomTextField(
                                                onTextFieldChanged: (value) {}),
                                            const SizedBox(
                                                height: spacingStandard)
                                          ])),
                                      const SizedBox(width: spacingExcel),
                                      Expanded(
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                            Text(StringConstants.kEmailAddress,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .xxTiniest
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w700)),
                                            const SizedBox(
                                                height: spacingSmall),
                                            CustomTextField(
                                                onTextFieldChanged: (value) {}),
                                            const SizedBox(
                                                height: spacingStandard),
                                            Text(StringConstants.kLastName,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .xxTiniest
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w700)),
                                            const SizedBox(
                                                height: spacingSmall),
                                            CustomTextField(
                                                onTextFieldChanged: (value) {}),
                                            const SizedBox(
                                                height: spacingStandard),
                                            Text(StringConstants.kMobileNo,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .xxTiniest
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w700)),
                                            const SizedBox(
                                                height: spacingSmall),
                                            CustomTextField(
                                                onTextFieldChanged: (value) {}),
                                            const SizedBox(
                                                height: spacingStandard),
                                          ]))
                                    ])),
                            Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 30),
                                  child: PrimaryButton(
                                    onPressed: () {},
                                    buttonTitle: "Update",
                                    buttonWidth: 200,
                                  ),
                                ))
                          ])))
            ]));
  }
}
