import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/product/product_bloc.dart';
import 'package:saasify/bloc/product/product_event.dart';
import 'package:saasify/configs/spacing.dart';
import 'package:saasify/screens/product/widgets/add_product_button.dart';
import 'package:saasify/screens/product/widgets/no_data_available_widget.dart';
import 'package:saasify/screens/product/widgets/product_screen_mobile.dart';
import 'package:saasify/screens/product/widgets/product_screen_web.dart';
import 'package:saasify/utils/responsive.dart';
import '../../bloc/product/product_state.dart';
import '../../configs/app_spacing.dart';
import '../../utils/constants/string_constants.dart';
import '../../utils/custom_dialogue_util.dart';
import '../../widgets/sidebar.dart';
import '../../widgets/top_bar.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = 'ProductScreen';

  static List<int> selectedIds = [];

  ProductScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    context.read<ProductBloc>().add(FetchProductList());

    return Scaffold(
        bottomNavigationBar: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return (constraints.maxWidth < 600)
              ? const Padding(
                  padding: EdgeInsets.only(
                      left: mobileBodyPadding,
                      right: mobileBodyPadding,
                      bottom: mobileBodyPadding),
                  child: AddProductButton())
              : const SizedBox.shrink();
        }),
        drawer: const SideBar(selectedIndex: 3),
        key: _scaffoldKey,
        body: Flex(
            crossAxisAlignment: CrossAxisAlignment.start,
            direction:
                context.responsive(Axis.vertical, desktop: Axis.horizontal),
            children: [
              context.responsive(
                  TopBar(
                      scaffoldKey: _scaffoldKey,
                      headingText: StringConstants.kProducts),
                  desktop: const Expanded(child: SideBar(selectedIndex: 3))),
              Expanded(
                  flex: 5,
                  child: Padding(
                      padding: const EdgeInsets.all(spacingLarge),
                      child: BlocConsumer<ProductBloc, ProductStates>(
                          listener: (context, state) {
                        if (state is ErrorFetchingProduct) {
                          CustomDialogueUtils.errorFetchingProductDialogue(
                              context, state.message);
                        }
                      }, buildWhen: (prev, curr) {
                        return curr is FetchingProduct ||
                            curr is FetchedProduct ||
                            curr is ErrorFetchingProduct;
                      }, builder: (context, state) {
                        if (state is FetchingProduct) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (state is FetchedProduct) {
                          return LayoutBuilder(builder: (BuildContext context,
                              BoxConstraints constraints) {
                            return (constraints.maxWidth < 600)
                                ? ProductScreenMobile(
                                    productList: state.productList,
                                    visible: state.productList.isEmpty)
                                : ProductScreenWeb(
                                    productList: state.productList,
                                    visible: state.productList.isEmpty);
                          });
                        } else if (state is ErrorFetchingProduct) {
                          return const NoDataAvailableWidget();
                        } else {
                          return const SizedBox.shrink();
                        }
                      })))
            ]));
  }
}
