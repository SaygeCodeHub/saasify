import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/profile/profile_bloc.dart';
import 'package:saasify/bloc/profile/profile_event.dart';
import 'package:saasify/bloc/profile/profile_states.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/screens/profile/widgets/profile_mobile_screen.dart';
import 'package:saasify/screens/profile/widgets/profile_web_screen.dart';
import 'package:saasify/utils/responsive.dart';
import '../../configs/app_color.dart';
import '../../configs/app_spacing.dart';
import '../../utils/constants/string_constants.dart';
import '../../widgets/sidebar.dart';
import '../../widgets/top_bar.dart';

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
                          return LayoutBuilder(builder: (BuildContext context,
                              BoxConstraints constraints) {
                            return (constraints.maxWidth < 600)
                                ? ProfileMobileScreen(
                                    profileData: state.profileData)
                                : ProfileWebScreen(
                                    profileData: state.profileData);
                          });
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
