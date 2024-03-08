import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/viewData/view_data_model.dart';
import 'package:saasify/screens/viewData/view_data_screen.dart';
import 'package:saasify/widgets/generalWidgets/status_chip.dart';

class ViewDataMobile extends StatelessWidget {
  final ViewData viewData;
  final void Function()? onRefresh;

  const ViewDataMobile({super.key, required this.viewData, this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return viewData.tileData == null
        ? Row(
            children: [
              TextButton(onPressed: onRefresh, child: const Text("Refresh")),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Back")),
            ],
          )
        : ListView.separated(
            itemCount: viewData.data.length,
            separatorBuilder: (context, index) =>
                const SizedBox(height: spacingSmallest),
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                    contentPadding: const EdgeInsets.all(spacingMedium),
                    leading: const Icon(Icons.person,
                        color: AppColors.darkBlue, size: kAvatarRadius),
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: spacingSmall),
                      child: Row(
                        children: [
                          Text(
                              viewData.data[index]
                                      [viewData.tileData?.title ?? ""] ??
                                  "",
                              style: Theme.of(context)
                                  .textTheme
                                  .userNameTextStyle),
                          const Spacer(),
                          StatusChip(
                              text: viewData.data[index]
                                      [viewData.tileData?.status ?? ""] ??
                                  "",
                              color: getColorFromStatus(
                                  viewData.data[index]["status_color"]))
                        ],
                      ),
                    ),
                    subtitle: Row(
                      children: [
                        Text(
                            viewData.data[index]
                                    [viewData.tileData?.subtitle ?? ""] ??
                                "",
                            style: Theme.of(context)
                                .textTheme
                                .statusTextStyle
                                .copyWith(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 10)),
                        const Spacer(),
                        const Icon(Icons.navigate_next_rounded,
                            color: AppColors.lighterBlack)
                      ],
                    )),
              );
            },
          );
  }
}
