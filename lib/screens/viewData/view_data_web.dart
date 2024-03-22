import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/table_models/column_data_model.dart';
import 'package:saasify/data/models/viewData/view_data_model.dart';
import 'package:saasify/screens/details/details_screen.dart';
import 'package:saasify/screens/viewData/view_data_screen.dart';
import 'package:saasify/utils/globals.dart';
import 'package:saasify/widgets/table/custom_table.dart';
import 'package:saasify/widgets/table/table_cells.dart';

class ViewDataWeb extends StatelessWidget {
  final ViewData viewData;
  final void Function()? onRefresh;
  final void Function(List<int>)? onSelectChanged;

  const ViewDataWeb(
      {super.key,
      required this.viewData,
      this.onSelectChanged,
      this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return viewData.columns == null
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
        : (isOnline)
            ? CustomDataTable(
                columnList: List.generate(
                    viewData.columns?.length ?? 0,
                    (index) => ColumnData(
                        header: viewData.columns?[index].columnTitle ?? "",
                        width: viewData.columns?[index].columnWidth)),
                dataIds: viewData.data.map((e) => e["id"] as int).toList(),
                onSelectChanged: onSelectChanged,
                rowOnTap: (_) {
                  Navigator.pushNamed(context, ViewDetailsScreen.routeName,
                      arguments: '');
                },
                generateData: (rowIndex) {
                  return List.generate(viewData.columns?.length ?? 0,
                      (dataIndex) {
                    return _getCellForColumnType(
                        viewData.columns?[dataIndex].dataType,
                        viewData.data[rowIndex][viewData
                                        .columns?[dataIndex].dataKey
                                        .toString() ??
                                    ""]
                                ?.toString() ??
                            "",
                        getColorFromStatus(
                            viewData.data[rowIndex]["status_color"]));
                  });
                })
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.7,
                    crossAxisCount: 4,
                    crossAxisSpacing: spacingSmall,
                    mainAxisSpacing: spacingSmall),
                itemBuilder: (context, index) {
                  return Card(
                      child: Padding(
                          padding: const EdgeInsets.all(spacingSmall),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          child: SizedBox.square(
                                            child: Image.network(
                                              "https://media.istockphoto.com/id/1398630614/photo/bacon-cheeseburger-on-a-toasted-bun.jpg?s=1024x1024&w=is&k=20&c=rXM2ry9bme764bKBGagwq4jYdjr7q98UiJLyHrl6BUU=",
                                              fit: BoxFit.cover,
                                              height: 100,
                                              width: 100,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: spacingSmall),
                                        Expanded(
                                          flex: 7,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("product name",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .productNameTextStyle,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textScaler: TextScaler.linear(
                                                      // isMobile
                                                      //     ? 0.8
                                                      //     :
                                                      1)),
                                              const SizedBox(
                                                  height: spacingSmallest),
                                              Text("description",
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .descriptionTextStyle,
                                                  textScaler: TextScaler.linear(
                                                      // isMobile ? 0.8 :
                                                      1)),
                                            ],
                                          ),
                                        ),
                                      ]),
                                ),
                                const SizedBox(height: spacingSmall),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      RichText(
                                          text: TextSpan(
                                              text: '₹ ',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .descriptionTextStyle,
                                              children: <TextSpan>[
                                            TextSpan(
                                                text: '300',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .productCostTextStyle)
                                          ]))
                                    ])
                              ])));
                });
  }

  DataCell _getCellForColumnType(
      String? type, String? data, Color statusColor) {
    switch (type) {
      case "text":
        return TableText(text: data ?? "");
      case "avatar":
        return const TableAvatar();
      case "status":
        return TableStatusChips(
            status:
                data?.toString().replaceAll('[', '').replaceAll(']', '') ?? '',
            color: statusColor);
      default:
        return TableText(text: "");
    }
  }
}
