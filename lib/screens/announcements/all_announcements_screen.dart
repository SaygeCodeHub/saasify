import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/announcemnet/announcement_bloc.dart';
import 'package:saasify/bloc/announcemnet/announcement_event.dart';
import 'package:saasify/bloc/announcemnet/announcement_state.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/data/models/announcement/get_all_announcements_model.dart';
import 'package:saasify/screens/announcements/add_announcement_screen.dart';
import 'package:saasify/screens/hrms/widgets/build_date.dart';
import 'package:saasify/widgets/actions/detailsPopUp.dart';
import 'package:saasify/widgets/alertDialogs/success_alert_dialog.dart';
import 'package:saasify/widgets/buttons/primary_button.dart';
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
                return ResponsiveLayout(
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

class AllAnnouncementMobile extends StatelessWidget {
  final List<Announcement> data;

  const AllAnnouncementMobile({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: data.length,
        shrinkWrap: true,
        separatorBuilder: (context, index) =>
            const SizedBox(height: spacingSmall),
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(spacingStandard),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.lighterBlack),
                borderRadius: BorderRadius.circular(kCardRadius)),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  buildDate(data[index].dueDate.toString(), context,
                      showDateIcon: true),
                  const SizedBox(height: spacingSmall),
                  Text(data[index].description, maxLines: 3)
                ]),
          );
        });
  }
}

class AllAnnouncementDesktop extends StatelessWidget {
  final List<Announcement> data;

  const AllAnnouncementDesktop({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 3.7,
            crossAxisSpacing: spacingMedium,
            mainAxisSpacing: spacingMedium),
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AnnouncementDetailsPopup(data: data[index]);
                  });
            },
            child: Container(
              padding: const EdgeInsets.all(spacingStandard),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.lighterBlack),
                  borderRadius: BorderRadius.circular(kCardRadius)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    buildDate(data[index].dueDate.toString(), context,
                        showDateIcon: true),
                    const SizedBox(height: spacingSmall),
                    Text(data[index].description, maxLines: 3)
                  ]),
            ),
          );
        });
  }
}

class AnnouncementDetailsPopup extends StatelessWidget {
  const AnnouncementDetailsPopup({
    super.key,
    required this.data,
  });

  final Announcement data;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AnnouncementBloc, AnnouncementStates>(
      listener: (context, state) {
        if (state is AnnouncementDeleted) {
          showDialog(
              context: context,
              builder: (context) => const SuccessAlertDialog(
                  description: "Announcement Deleted Successfully"));
          context.read<AnnouncementBloc>().add(GetAllAnnouncements());
          Navigator.pop(context);
        }
        if (state is AnnouncementDeleted) {}
      },
      child: DetailsPopUp(
          title: "Announcement",
          actionsBuilder: (commentsKey) {
            return [
              PrimaryButton(
                  buttonWidth: kGeneralActionButtonWidth,
                  backgroundColor: AppColors.errorRed,
                  onPressed: () {
                    context
                        .read<AnnouncementBloc>()
                        .add(DeleteAnnouncement(id: data.id));
                  },
                  buttonTitle: "Delete"),
              PrimaryButton(
                  buttonWidth: kGeneralActionButtonWidth,
                  backgroundColor: AppColors.darkBlue,
                  onPressed: () {
                    context
                        .read<AnnouncementBloc>()
                        .setAnnouncementDetails(data);
                    Navigator.pushNamed(
                            context, AddAnnouncementScreen.routeName,
                            arguments: true)
                        .whenComplete(() {
                      context
                          .read<AnnouncementBloc>()
                          .add(GetAllAnnouncements());
                      Navigator.pop(context);
                    });
                  },
                  buttonTitle: "Edit"),
            ];
          },
          details: [
            buildDate(data.dueDate.toString(), context,
                showDateIcon: true, orangeColor: false),
            const SizedBox(height: spacingLarge),
            DetailsField(data: data.description, title: "Description"),
          ],
          showComments: false,
          commentsRequired: false),
    );
  }
}
