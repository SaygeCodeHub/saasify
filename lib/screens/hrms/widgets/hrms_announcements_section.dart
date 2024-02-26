import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/initialise/initialise_bloc.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/screens/hrms/widgets/build_date.dart';
import 'package:saasify/widgets/text/module_heading.dart';

class HrmsAnnouncementsSection extends StatelessWidget {
  final bool isMobile;

  const HrmsAnnouncementsSection({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    var data = context
        .read<InitialiseAppBloc>()
        .initialiseAppModel!
        .data!
        .announcements!;
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const ModuleHeading(label: 'Announcements'),
              InkWell(
                  onTap: () {},
                  child: Text('View All',
                      style: Theme.of(context)
                          .textTheme
                          .labelTextStyle
                          .copyWith(
                              fontWeight: FontWeight.w800,
                              color: AppColors.orange)))
            ],
          ),
          const SizedBox(height: spacingLarger),
          Container(
              height: MediaQuery.sizeOf(context).height * 0.20,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.lighterBlack),
                  borderRadius: BorderRadius.circular(kCardRadius)),
              child: Padding(
                  padding: const EdgeInsets.all(spacingSmall),
                  child: data.isEmpty
                      ? buildEmptyAnnouncements(context)
                      : ListView.builder(
                          itemCount: 3,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(spacingSmall),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        width: 78,
                                        child: buildDate(
                                            data[index].dueDate.toString(),
                                            context)),
                                    const Text(' : '),
                                    Expanded(
                                      child: Text(data[index].description,
                                          maxLines: 2),
                                    )
                                  ]),
                            );
                          })))
        ]);
  }

  Widget buildViewAllButton(context) {
    return TextButton(
        onPressed: () {},
        child: Text('View all',
            style: Theme.of(context).textTheme.labelTextStyle.copyWith(
                fontWeight: FontWeight.w800, color: AppColors.orange)));
  }

  Widget buildEmptyAnnouncements(context) {
    return Center(
      child: Text('No Announcements',
          style: Theme.of(context)
              .textTheme
              .labelTextStyle
              .copyWith(fontWeight: FontWeight.w800, color: AppColors.orange)),
    );
  }
}
