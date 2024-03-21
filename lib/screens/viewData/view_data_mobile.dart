import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/viewData/view_data_model.dart';
import 'package:saasify/screens/details/details_screen.dart';
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
                    onTap: () {
                      Navigator.pushNamed(context, ViewDetailsScreen.routeName,
                          arguments: '');
                    },
                    contentPadding: const EdgeInsets.all(spacingMedium),
                    leading: Container(
                        padding: const EdgeInsets.all(spacingXSmall),
                        decoration: BoxDecoration(
                            color: AppColors.lightBlue.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(
                                kViewPersonContainerRadius)),
                        child: const Icon(Icons.person_2_outlined,
                            color: AppColors.black, size: kViewPersonIconSize)),
                    trailing: const Icon(Icons.navigate_next_rounded,
                        color: AppColors.black, size: kViewNextIconSize),
                    title: Padding(
                      padding: const EdgeInsets.only(
                          left: spacingXSmall, bottom: spacingXXSmall),
                      child: Text(
                          viewData.data[index]
                                  [viewData.tileData?.title ?? ""] ??
                              "",
                          style: Theme.of(context).textTheme.userNameTextStyle),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(left: spacingXSmall),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                      fontSize: 12)),
                          const SizedBox(height: spacingXSmall),
                          Visibility(
                            visible: viewData.data[index]
                                    [viewData.tileData?.status ?? ""] !=
                                null,
                            child: StatusChip(
                                text: viewData.data[index]
                                            [viewData.tileData?.status ?? ""]
                                        ?.toString() ??
                                    "",
                                color: getColorFromStatus(
                                    viewData.data[index]["status_color"])),
                          )
                        ],
                      ),
                    )),
              );
            },
          );
  }
}
