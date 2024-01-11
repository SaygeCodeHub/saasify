import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/product/product_bloc.dart';
import '../../../bloc/product/product_event.dart';
import '../../../bloc/product/product_state.dart';
import '../../../bloc/upload/upload_bloc.dart';
import '../../../bloc/upload/upload_events.dart';
import '../../../configs/app_spacing.dart';
import '../../../utils/constants/string_constants.dart';
import '../../../utils/custom_dialogue_util.dart';
import '../../../utils/progress_bar.dart';
import '../../../widgets/primary_button.dart';

class PublishProductButton extends StatelessWidget {
  final Map dataMap;
  final bool isEdit;
  final GlobalKey<FormState> _formKey;

  const PublishProductButton({
    super.key,
    required this.dataMap,
    required this.isEdit,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductBloc, ProductStates>(
      listener: (context, state) {
        if (state is SavingProduct) {
          ProgressBar.show(context);
        } else if (state is SavedProduct) {
          ProgressBar.dismiss(context);
          CustomDialogueUtils.productSavedDialogue(
              context,
              state.data.productName,
              state.data.categoryName,
              state.data.brandName,
              state.data.productDescription,
              state.data.productId);
        } else if (state is ErrorSavingProduct) {
          ProgressBar.dismiss(context);
          CustomDialogueUtils.errorSavingProductDialogue(
              context, state.message);
        } else if (state is EditingProduct) {
          ProgressBar.show(context);
        } else if (state is EditedProduct) {
          ProgressBar.dismiss(context);
          CustomDialogueUtils.productEditedDialogue(context, state.message);
        } else if (state is ErrorEditingProduct) {
          ProgressBar.dismiss(context);
          CustomDialogueUtils.errorEditingProductDialogue(
              context, state.message);
        }
      },
      child: PrimaryButton(
          onPressed: () {
            dataMap['draft'] = false;
            if (_formKey.currentState!.validate()) {
              if (context.read<UploadBloc>().displayImageList.isNotEmpty) {
                if (context.read<UploadBloc>().pickedImageList.isNotEmpty) {
                  context.read<UploadBloc>().add(UploadImage(
                      multiplePartFileList:
                          context.read<UploadBloc>().pickedFiles));
                } else {
                  if (isEdit) {
                    context
                        .read<ProductBloc>()
                        .add(EditProduct(productDetailsMap: dataMap));
                  } else {
                    context
                        .read<ProductBloc>()
                        .add(SaveProduct(productDetailsMap: dataMap));
                  }
                }
              } else {
                context.read<UploadBloc>().add(NoImageSelected());
              }
            }
          },
          buttonWidth: spacingXXXXHuge,
          buttonTitle: StringConstants.kPublish),
    );
  }
}
