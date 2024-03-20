import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/POS/pos_bloc.dart';
import 'package:saasify/bloc/POS/pos_event.dart';
import 'package:saasify/bloc/POS/pos_state.dart';
import 'package:saasify/screens/POS/pos_mobile.dart';
import 'package:saasify/screens/POS/pos_web.dart';
import 'package:saasify/widgets/alertDialogs/error_alert_dialog.dart';
import 'package:saasify/widgets/layoutWidgets/responsive_layout.dart';
import 'package:saasify/widgets/layoutWidgets/screen_skeleton.dart';

class POSScreen extends StatelessWidget {
  static const String routeName = 'POS';

  const POSScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<POSBloc>().add(FetchProductsWithCategories());
    return ScreenSkeleton(childScreenBuilder: (isMobile) {
      return BlocConsumer<POSBloc, POSStates>(
        listener: (context, state) {
          if (state is ProductByCategoryError) {
            showDialog(
                context: context,
                builder: (context) {
                  return ErrorAlertDialog(description: state.errorMessage);
                });
          }
        },
        builder: (context, state) {
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
        },
      );
    });
  }
}
