import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/POS/pos_bloc.dart';
import 'package:saasify/bloc/POS/pos_event.dart';
import 'package:saasify/bloc/POS/pos_state.dart';
import 'package:saasify/widgets/alertDialogs/error_alert_dialog.dart';
import 'package:saasify/widgets/layoutWidgets/screen_skeleton.dart';
import 'package:saasify/widgets/userInput/custom_drop_down.dart';

class POSScreen extends StatelessWidget {
  static const String routeName = 'pos';

  const POSScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<POSBloc>().add(FetchProductsWithCategories());
    return ScreenSkeleton(childScreenBuilder: (isMobile) {
      return BlocConsumer<POSBloc, POSStates>(
        listener: (context, state) {
          if (state is ProductByCategoryError) {
            showDialog(context: context, builder: (context) {
              return ErrorAlertDialog(description: state.errorMessage);
            });
          }
        },
        builder: (context, state) {
          if (state is ProductByCategoryLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ProductByCategoryLoaded) {
            return Container(
              child: Column(
                children: [
                  CustomDropDown(
                      items: List.generate(
                          state.productWithCategories[0].data.length,
                          (index) => state.productWithCategories[0].data[index].categoryName),
                      defaultValue: "Select Category",
                      onChanged: (value) {}),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      );
    });
  }
}
