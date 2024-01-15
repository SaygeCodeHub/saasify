import 'package:flutter/material.dart';
import 'package:saasify/configs/app_color.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/orders/fetch_orders_model.dart';
import 'package:saasify/utils/responsive.dart';
import '../../../configs/app_spacing.dart';
import '../../../utils/dashboard_card.dart';

class DashboardHeaderCards extends StatelessWidget {
  const DashboardHeaderCards({super.key, required this.ordersData});

  final OrdersData ordersData;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              height: spacingStandard,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kCircularRadius),
                  boxShadow: const [
                    BoxShadow(
                        color: AppColor.saasifyLightPaleGrey, blurRadius: 5.0)
                  ],
                  color: AppColor.saasifyWhite),
              child: Center(
                  child: ListTile(
                      titleAlignment: ListTileTitleAlignment.titleHeight,
                      tileColor: AppColor.saasifyWhite,
                      leading: Container(
                          height: kDashboardIconContainerSize,
                          width: kDashboardIconContainerSize,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(kGeneralRadius),
                              color: dashboardCard[index].iconColor),
                          child: Icon(dashboardCard[index].iconName,
                              color: dashboardCard[index].containerColor)),
                      title: Padding(
                          padding: const EdgeInsets.only(
                              left: spacingXSmall, top: spacingStandard),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          dashboardCard[index].title.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .xxTiniest
                                              .copyWith(
                                                  fontWeight: FontWeight.w500),
                                          textScaleFactor: context
                                              .responsive(0.63, desktop: 1)),
                                      Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: spacingXSmall,
                                              vertical: spacingSmallest),
                                          decoration: BoxDecoration(
                                              color: dashboardCard[index]
                                                  .iconColor,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      kGeneralRadius)),
                                          child: Text("+9%",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .xTiniest
                                                  .copyWith(
                                                      color:
                                                          dashboardCard[index]
                                                              .containerColor)))
                                    ]),
                                const SizedBox(height: spacingXSmall),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          dashboardCard[index]
                                              .subtitle
                                              .toString(),
                                          textScaleFactor: context
                                              .responsive(0.63, desktop: 1),
                                          style: Theme.of(context)
                                              .textTheme
                                              .tinier
                                              .copyWith(
                                                  fontWeight: FontWeight.w600)),
                                      Text("From last Week",
                                          style: Theme.of(context)
                                              .textTheme
                                              .xxxTiniest
                                              .copyWith(
                                                  color: AppColor.saasifyGrey))
                                    ])
                              ])))));
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 3.5,
            crossAxisSpacing: spacingLarge,
            mainAxisSpacing: spacingLarge));
  }
}
