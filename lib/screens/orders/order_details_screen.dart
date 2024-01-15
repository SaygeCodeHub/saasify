import 'package:flutter/material.dart';
import 'package:saasify/data/models/orders/fetch_orders_model.dart';
import 'package:saasify/screens/orders/widgets/order_bill_details.dart';
import 'package:saasify/screens/orders/widgets/order_details_header_widget.dart';
import 'package:saasify/screens/orders/widgets/order_details_product_list.dart';
import 'package:saasify/utils/responsive.dart';
import '../../configs/app_color.dart';
import '../../configs/app_spacing.dart';
import '../../utils/constants/string_constants.dart';
import '../../widgets/custom_page_header.dart';
import '../../widgets/sidebar.dart';
import '../../widgets/top_bar.dart';
import 'orders_screen.dart';

class OrderDetailsScreen extends StatelessWidget {
  final Order orderListDatum;

  static const String routeName = 'OrderDetailsScreen';

  OrderDetailsScreen({super.key, required this.orderListDatum});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.saasifyLightGreyBlue,
        key: _scaffoldKey,
        drawer: const SideBar(selectedIndex: 5),
        body: Flex(
            direction:
                context.responsive(Axis.vertical, desktop: Axis.horizontal),
            children: [
              context.responsive(
                  TopBar(
                      scaffoldKey: _scaffoldKey,
                      headingText: StringConstants.kOrders),
                  desktop: const Expanded(
                    child: SideBar(selectedIndex: 5),
                  )),
              Expanded(
                  flex: 5,
                  child: Padding(
                      padding: const EdgeInsets.all(spacingLarge),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomPageHeader(
                              titleText: StringConstants.kOrderDetails,
                              textFieldVisible: false,
                              utilityVisible: true,
                              backIconVisible: true,
                              onBack: () {
                                Navigator.pushReplacementNamed(
                                    context, OrdersScreen.routeName);
                              },
                            ),
                            const SizedBox(height: spacingStandard),
                            OrderDetailsHeaderWidget(
                                orderListDatum: orderListDatum),
                            const SizedBox(height: spacingMedium),
                            const SizedBox(height: spacingMedium),
                            OrderDetailsProductList(
                                orderListDatum: orderListDatum),
                            const SizedBox(height: spacingMedium),
                            OrderBillDetails(orderListDatum: orderListDatum),
                          ])))
            ]));
  }
}
