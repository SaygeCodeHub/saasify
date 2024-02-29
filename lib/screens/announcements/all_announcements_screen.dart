import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/announcemnet/announcement_bloc.dart';
import 'package:saasify/bloc/announcemnet/announcement_event.dart';
import 'package:saasify/bloc/announcemnet/announcement_state.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/screens/announcements/widgets/all_announcements_mobile.dart';
import 'package:saasify/screens/announcements/widgets/all_announcements_web.dart';
import 'package:saasify/widgets/layoutWidgets/responsive_layout.dart';
import 'package:saasify/widgets/layoutWidgets/screen_skeleton.dart';
import 'package:saasify/widgets/text/module_heading.dart';

class AllAnnouncementsScreen extends StatelessWidget {
  static const String routeName = 'AllAnnouncementsScreen';

  const AllAnnouncementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AnnouncementBloc>().add(GetAllAnnouncements());
    return ScreenSkeleton(childScreenBuilder: (isMobile) {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: spacingMedium),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: spacingMedium),
                  child: Row(children: [
                    isMobile ? const SizedBox.shrink() : const BackButton(),
                    const SizedBox(width: spacingXMedium),
                    const ModuleHeading(label: "Announcements")
                  ]))
            ]),
            Expanded(child: BlocBuilder<AnnouncementBloc, AnnouncementStates>(
                builder: (context, state) {
              if (state is GettingAllAnnouncements) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is AllAnnouncementsFetched) {
                return state.announcements.isEmpty
                    ? Center(
                        child: Text("No Announcements",
                            style:
                                Theme.of(context).textTheme.disabledTextStyle))
                    : ResponsiveLayout(
                        mobileBody:
                            AllAnnouncementMobile(data: state.announcements),
                        desktopBody:
                            AllAnnouncementDesktop(data: state.announcements));
              } else if (state is ErrorGettingAllAnnouncements) {
                return Center(child: Text(state.errorMessage));
              } else {
                return const SizedBox.shrink();
              }
            }))
          ]);
    });
  }
}
