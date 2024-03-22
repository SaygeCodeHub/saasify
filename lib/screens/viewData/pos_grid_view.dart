import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/viewData/view_data_model.dart';

class PosGridView extends StatelessWidget {
  final Map posDataMap;
  final List<ViewPOSData> viewPosData;

  const PosGridView(
      {super.key, required this.posDataMap, required this.viewPosData});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.7,
            crossAxisCount: 4,
            crossAxisSpacing: spacingSmall,
            mainAxisSpacing: spacingSmall),
        itemCount: viewPosData.length,
        itemBuilder: (context, index) {
          return Card(
              child: Padding(
                  padding: const EdgeInsets.all(spacingSmall),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: SizedBox.square(
                                      child: Image.network(
                                          "https://media.istockphoto.com/id/1398630614/photo/bacon-cheeseburger-on-a-toasted-bun.jpg?s=1024x1024&w=is&k=20&c=rXM2ry9bme764bKBGagwq4jYdjr7q98UiJLyHrl6BUU=",
                                          fit: BoxFit.cover,
                                          height:
                                              posDataMap['isMobile'] ? 50 : 100,
                                          width: posDataMap['isMobile']
                                              ? 50
                                              : 100)),
                                ),
                                const SizedBox(width: spacingSmall),
                                Expanded(
                                  flex: 7,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(viewPosData[index].name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .productNameTextStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          textScaler: TextScaler.linear(
                                              posDataMap['isMobile']
                                                  ? 0.8
                                                  : 1)),
                                      const SizedBox(height: spacingSmallest),
                                      Text(viewPosData[index].description,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .descriptionTextStyle,
                                          textScaler: TextScaler.linear(
                                              posDataMap['isMobile']
                                                  ? 0.8
                                                  : 1)),
                                    ],
                                  ),
                                ),
                              ]),
                        ),
                        const SizedBox(height: spacingSmall),
                        Visibility(
                          visible: viewPosData[index].price.toString() != "0",
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                    text: TextSpan(
                                        text: '₹ ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .descriptionTextStyle,
                                        children: <TextSpan>[
                                      TextSpan(
                                          text: viewPosData[index]
                                              .price
                                              .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .productCostTextStyle)
                                    ]))
                              ]),
                        )
                      ])));
        });
  }
}
