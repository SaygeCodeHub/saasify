import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/data/models/viewData/view_data_model.dart';
import 'package:saasify/screens/viewData/view_data_screen.dart';
import 'package:saasify/widgets/generalWidgets/status_chip.dart';

class ViewDataMobile extends StatelessWidget {
  final ViewData viewData;

  const ViewDataMobile({super.key, required this.viewData});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: viewData.data.length,
      separatorBuilder: (context, index) =>
          const SizedBox(height: spacingSmallest),
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: AppColors.lightBlue,
              child: Text(viewData.data[index][viewData.tileData.avatar]),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(viewData.data[index][viewData.tileData.title]),
                Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: spacingSmallest),
                    child: StatusChip(
                        text: viewData.data[index][viewData.tileData.status],
                        color: getColorFromStatus(viewData.statusTypes,
                            viewData.data[index][viewData.tileData.status])))
              ],
            ),
            subtitle: Text(viewData.data[index][viewData.tileData.subtitle]),
          ),
        );
      },
    );
  }
}
