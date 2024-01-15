import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/orders/orders_bloc.dart';
import 'package:saasify/bloc/orders/orders_event.dart';
import 'package:saasify/bloc/orders/orders_state.dart';
import 'package:saasify/configs/app_color.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/utils/responsive.dart';
import 'package:saasify/widgets/alert_dialogue_box.dart';
import 'package:saasify/widgets/sidebar.dart';
import '../../widgets/top_bar.dart';
import 'widgets/dasboard_body.dart';
import 'widgets/dashboard_header_cards.dart';

class DashboardsScreen extends StatelessWidget {
  static const String routeName = 'DashboardsScreen';

  DashboardsScreen({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    context.read<OrdersBloc>().add(FetchOrdersList());
    return Scaffold(
        key: _scaffoldKey,
        drawer: const SideBar(selectedIndex: 1),
        body: Flex(
            direction:
                context.responsive(Axis.vertical, desktop: Axis.horizontal),
            children: [
              context.responsive(
                  TopBar(
                      scaffoldKey: _scaffoldKey,
                      headingText: StringConstants.kDashboard),
                  desktop: const Expanded(child: SideBar(selectedIndex: 1))),
              Expanded(
                  flex: 5,
                  child: Container(
                    color: AppColor.saasifyLightestPaleGrey,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: spacingLarge, vertical: spacingXMedium),
                        child: BlocConsumer<OrdersBloc, OrdersStates>(
                            listener: (context, state) {
                          if (state is ErrorFetchingOrders) {
                            showDialog(
                                context: context,
                                builder: (dialogueCtx) {
                                  return AlertDialogueBox(
                                      title:
                                          StringConstants.kSomethingWentWrong,
                                      message: state.message,
                                      errorMarkVisible: true,
                                      primaryButtonTitle: StringConstants.kOk,
                                      primaryOnPressed: () {
                                        Navigator.pop(dialogueCtx);
                                      });
                                });
                          }
                        }, buildWhen: (prev, curr) {
                          return curr is FetchedOrders ||
                              curr is FetchingOrders;
                        }, builder: (context, state) {
                          if (state is FetchingOrders) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (state is FetchedOrders) {
                            return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(children: [
                                    context.responsive(const SizedBox(),
                                        desktop: Text(
                                            StringConstants.kDashboard,
                                            maxLines: 2,
                                            style: Theme.of(context)
                                                .textTheme
                                                .xxTiny
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.w700)))
                                  ]),
                                  context.responsive(const SizedBox(),
                                      desktop:
                                          const SizedBox(height: spacingLarge)),
                                  DashboardHeaderCards(
                                      ordersData: state.fetchOrdersList),
                                  const SizedBox(height: spacingLarge),
                                  Expanded(
                                      child: DashboardBody(
                                          ordersData: state.fetchOrdersList))
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
                        })),
                  ))
            ]));
  }
}
