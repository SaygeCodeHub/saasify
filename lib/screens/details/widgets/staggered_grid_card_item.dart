import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/details/fetch_details_model.dart';
import 'package:saasify/screens/details/widgets/circle_avatar_widget.dart';

class StaggeredGridCardItem extends StatelessWidget {
  final Section sections;

  const StaggeredGridCardItem({super.key, required this.sections});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: spacingLarge, vertical: spacingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
                visible: sections.avatar.isEmpty,
                child: const CircleAvatarWidget()),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(sections.details.length, (rowIndex) {
                return Padding(
                    padding: const EdgeInsets.all(spacingXSmall),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(sections.details[rowIndex].label,
                                style: Theme.of(context)
                                    .textTheme
                                    .detailsLabelTextStyle),
                          ),
                          Flexible(
                            child: Text(sections.details[rowIndex].value,
                                style: Theme.of(context)
                                    .textTheme
                                    .detailsLabelValueTextStyle),
                          )
                        ]));
              }),
            )
          ],
        ),
      ),
    );
  }
}
