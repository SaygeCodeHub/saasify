import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/orders/orders_bloc.dart';
import 'package:saasify/bloc/orders/orders_event.dart';
import 'package:saasify/bloc/orders/orders_state.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/utils/responsive.dart';
import 'package:saasify/widgets/custom_page_header.dart';
import 'package:saasify/widgets/sidebar.dart';
import 'package:saasify/widgets/top_bar.dart';
import '../../configs/app_color.dart';
import '../../widgets/alert_dialogue_box.dart';
import 'orders_list_datatable.dart';

class OrdersScreen extends StatelessWidget {
  static const String routeName = 'OrdersScreen';

  OrdersScreen({Key? key}) : super(key: key);

  static List selectedIds = [];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    context.read<OrdersBloc>().add(FetchOrdersList());

    return Scaffold(
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
                  desktop: const Expanded(child: SideBar(selectedIndex: 5))),
              Expanded(
                  flex: 5,
                  child: Padding(
                      padding: const EdgeInsets.all(spacingLarge),
                      child: BlocConsumer<OrdersBloc, OrdersStates>(
                          listener: (context, state) {
                        if (state is ErrorFetchingOrders) {
                          showDialog(
                              context: context,
                              builder: (dialogueCtx) {
                                return AlertDialogueBox(
                                    title: StringConstants.kSomethingWentWrong,
                                    message: state.message,
                                    errorMarkVisible: true,
                                    primaryButtonTitle: StringConstants.kOk,
                                    primaryOnPressed: () {
                                      Navigator.pop(dialogueCtx);
                                    });
                              });
                        }
                      }, buildWhen: (prev, curr) {
                        return curr is FetchedOrders || curr is FetchingOrders;
                      }, builder: (context, state) {
                        if (state is FetchingOrders) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (state is FetchedOrders) {
                          return Column(children: [
                            const CustomPageHeader(
                                utilityVisible: true,
                                titleText: StringConstants.kOrders,
                                textFieldVisible: true),
                            const SizedBox(height: spacingStandard),
                            OrdersListDataTable(
                                orderListDatum: state.fetchOrdersList),
                            Visibility(
                                visible: state.fetchOrdersList.orders.isEmpty,
                                child: Center(
                                    child: Text(
                                        StringConstants.kNoDataAvailable,
                                        style: Theme.of(context)
                                            .textTheme
                                            .tinier
                                            .copyWith(
                                                fontWeight: FontWeight.w500,
                                                color: AppColor
                                                    .saasifyLightGrey)))),
                            Visibility(
                                visible: state.fetchOrdersList.orders.isEmpty,
                                child: const Spacer())
                          ]);
                        } else if (state is ErrorFetchingOrders) {
                          return Center(
                              child: Text(StringConstants.kNoDataAvailable,
                                  style: Theme.of(context)
                                      .textTheme
                                      .tinier
                                      .copyWith(
                                          color: AppColor.saasifyLightGrey)));
                        } else {
                          return const SizedBox.shrink();
                        }
                      })))
            ]));
  }
}
