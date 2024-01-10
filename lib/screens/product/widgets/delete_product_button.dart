import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/product/product_bloc.dart';
import '../../../bloc/product/product_event.dart';
import '../../../bloc/product/product_state.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../utils/constants/string_constants.dart';
import '../../../utils/progress_bar.dart';
import '../../../widgets/alert_dialogue_box.dart';
import '../product_list_screen.dart';

class DeleteProductButton extends StatelessWidget {
  const DeleteProductButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductBloc, ProductStates>(
      listener: (context, state) {
        if (state is DeletingProducts) {
          ProgressBar.show(context);
        }
        if (state is DeletedProducts) {
          ProgressBar.dismiss(context);
          showDialog(
              context: context,
              builder: (ctx) => AlertDialogueBox(
                    title: StringConstants.kSuccess,
                    message: state.message,
                    primaryButtonTitle: StringConstants.kOk,
                    checkMarkVisible: false,
                    primaryOnPressed: () {
                      context.read<ProductBloc>().add(FetchProductList());
                      ProductListScreen.selectedIds = [];
                      Navigator.pop(ctx);
                    },
                  ));
        }
        if (state is ErrorDeletingProducts) {
          ProgressBar.dismiss(context);
          showDialog(
              context: context,
              builder: (ctx) => AlertDialogueBox(
                  title: StringConstants.kSomethingWentWrong,
                  message: state.message,
                  primaryButtonTitle: StringConstants.kOk,
                  checkMarkVisible: false,
                  primaryOnPressed: () {
                    Navigator.pop(ctx);
                  }));
        }
      },
      child: IconButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => AlertDialogueBox(
                    title: StringConstants.kWarning,
                    message: StringConstants.kTheSelectedProducts,
                    primaryButtonTitle: StringConstants.kConfirm,
                    secondaryButtonTitle: StringConstants.kCancel,
                    checkMarkVisible: false,
                    secondaryOnPressed: () {
                      Navigator.pop(context);
                    },
                    primaryOnPressed: () {
                      Navigator.pop(context);
                      context.read<ProductBloc>().add(DeleteProducts(
                          variantIds: ProductListScreen.selectedIds));
                    }));
          },
          icon: const Icon(Icons.delete,
              color: AppColor.saasifyRed, size: kHeaderIconsSize)),
    );
  }
}
