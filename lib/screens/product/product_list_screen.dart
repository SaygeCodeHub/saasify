import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/product/product_bloc.dart';
import 'package:saasify/bloc/product/product_event.dart';
import 'package:saasify/configs/spacing.dart';
import 'package:saasify/screens/product/product_list_screen_mobile.dart';
import 'package:saasify/screens/product/product_list_screen_web.dart';
import 'package:saasify/screens/product/widgets/add_product_button.dart';
import '../../widgets/sidebar.dart';

class ProductListScreen extends StatelessWidget {
  static const String routeName = 'ProductListScreen';

  static List<int> selectedIds = [];

  ProductListScreen({super.key});

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
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return (constraints.maxWidth < 600)
              ? ProductListScreenMobile(scaffoldKey: _scaffoldKey)
              : ProductListScreenWeb(scaffoldKey: _scaffoldKey);
        }));
  }
}
