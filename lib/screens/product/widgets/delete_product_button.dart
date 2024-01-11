import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/utils/custom_dialogue_util.dart';
import '../../../bloc/product/product_bloc.dart';
import '../../../bloc/product/product_state.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../utils/progress_bar.dart';

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
            CustomDialogueUtils.deletedProductDialogue(context, state.message);
          }
          if (state is ErrorDeletingProducts) {
            ProgressBar.dismiss(context);
            CustomDialogueUtils.errorDeletingProductDialogue(
                context, state.message);
          }
        },
        child: IconButton(
            onPressed: () {
              CustomDialogueUtils.deleteProductWarningDialogue(context);
            },
            icon: const Icon(Icons.delete,
                color: AppColor.saasifyRed, size: kHeaderIconsSize)));
  }
}
