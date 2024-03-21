import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/POS/pos_bloc.dart';
import 'package:saasify/bloc/POS/pos_event.dart';
import 'package:saasify/bloc/POS/pos_state.dart';
import 'package:saasify/data/models/screenArguments/no_data_screen_arguments.dart';
import 'package:saasify/screens/POS/pos_mobile.dart';
import 'package:saasify/screens/POS/pos_web.dart';
import 'package:saasify/screens/generalScreens/no_data_found_screen.dart';
import 'package:saasify/widgets/layoutWidgets/responsive_layout.dart';
import 'package:saasify/widgets/layoutWidgets/screen_skeleton.dart';

class POSScreen extends StatelessWidget {
  static const String routeName = 'POSScreen';

  const POSScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<POSBloc>().add(FetchProductsWithCategories());
    return ScreenSkeleton(childScreenBuilder: (isMobile) {
      return BlocConsumer<POSBloc, POSStates>(listener: (context, state) {
        if (state is ProductByCategoryError) {
          Navigator.pushReplacementNamed(context, NoDataFoundScreen.routeName,
              arguments: NoDataScreenArguments(
                  heading: "No data found!", message: ''));
        }
      }, builder: (context, state) {
        if (state is ProductByCategoryLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ProductByCategoryLoaded) {
          return ResponsiveLayout(
              mobileBody: POSMobile(
                  productsWithCategories: state.productsWithCategories,
                  selectedCategory: state.selectedCategory,
                  cartItems: state.cartItems),
              provideMobilePadding: false,
              desktopBody: POSWeb(
                  productsWithCategories: state.productsWithCategories,
                  selectedCategory: state.selectedCategory,
                  cartItems: state.cartItems));
        }
        return const SizedBox.shrink();
      });
    });
  }
}
