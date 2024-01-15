import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/profile/profile_bloc.dart';
import 'package:saasify/bloc/profile/profile_event.dart';
import 'package:saasify/bloc/profile/profile_states.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/screens/settings/widgets/profile_form.dart';
import 'package:saasify/utils/responsive.dart';
import 'package:saasify/widgets/custom_page_header.dart';
import '../../configs/app_color.dart';
import '../../configs/app_dimensions.dart';
import '../../configs/app_spacing.dart';
import '../../utils/constants/string_constants.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/sidebar.dart';
import '../../widgets/top_bar.dart';
import '../dashboard/dashboard_screen.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = 'ProfileScreen';

  ProfileScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    context.read<ProfileBloc>().add(FetchProfileDetails());
    return Scaffold(
        key: _scaffoldKey,
        drawer: const SideBar(selectedIndex: 1),
        body: Flex(
            direction:
                context.responsive(Axis.vertical, desktop: Axis.horizontal),
            children: [
              context.responsive(
                  TopBar(
                      scaffoldKey: _scaffoldKey,
                      headingText: StringConstants.kProfile),
                  desktop: const Expanded(child: SideBar(selectedIndex: 1))),
              Expanded(
                  flex: 5,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          right: spacingXHuge,
                          left: spacingXHuge,
                          bottom: spacingXHuge,
                          top: spacingXMedium),
                      child: BlocBuilder<ProfileBloc, ProfileStates>(
                          buildWhen: (prev, curr) {
                        return curr is FetchedProfileDetails ||
                            curr is FetchingProfileDetails;
                      }, builder: (context, state) {
                        if (state is FetchingProfileDetails) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (state is FetchedProfileDetails) {
                          return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomPageHeader(
                                    textFieldVisible: false,
                                    onBack: () {
                                      Navigator.pushReplacementNamed(
                                          context, DashboardsScreen.routeName);
                                    },
                                    backIconVisible: true,
                                    titleText: StringConstants.kProfile),
                                const SizedBox(height: spacingStandard),
                                Text(StringConstants.kBrandLogo,
                                    style: Theme.of(context)
                                        .textTheme
                                        .xxTiniest
                                        .copyWith(fontWeight: FontWeight.w700)),
                                const SizedBox(height: spacingXMedium),
                                Container(
                                  height: kDashContainerHeight,
                                  width: kImageContainerWidth,
                                  decoration: BoxDecoration(
                                      color: AppColor.saasifyLighterGrey,
                                      borderRadius: BorderRadius.circular(
                                          kCircularRadius)),
                                  child: Padding(
                                      padding:
                                          const EdgeInsets.all(spacingStandard),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const SizedBox(
                                                height: spacingSmall),
                                            (state.profileData.storeLogo
                                                    .toString()
                                                    .isNotEmpty)
                                                ? Image.network(
                                                    state.profileData.storeLogo
                                                        .toString(),
                                                    height: spacingXLarge,
                                                    width: spacingXLarge,
                                                    color: AppColor
                                                        .saasifyPaleBlack,
                                                    errorBuilder: (context,
                                                        error, stackTrace) {
                                                      return const Text(
                                                          'Image is not available');
                                                    },
                                                  )
                                                : Image.asset(
                                                    "assets/error_image.png",
                                                    height: kButtonHeight),
                                          ])),
                                ),
                                const SizedBox(height: spacingStandard),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        right: spacingXXLarge),
                                    child: ProfileScreenForm(
                                      profileData: state.profileData,
                                    )),
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: spacingXXLarge),
                                      child: PrimaryButton(
                                        onPressed: () {},
                                        buttonTitle: StringConstants.kUpdate,
                                        buttonWidth: spacingXXXXHuge,
                                      ),
                                    ))
                              ]);
                        } else if (state is ErrorFetchingProfileDetails) {
                          return Expanded(
                              child: Center(
                                  child: Text(StringConstants.kNoDataAvailable,
                                      style: Theme.of(context)
                                          .textTheme
                                          .tinier
                                          .copyWith(
                                              color:
                                                  AppColor.saasifyLightGrey))));
                        } else {
                          return const SizedBox.shrink();
                        }
                      })))
            ]));
  }
}
