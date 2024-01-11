import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/product/product_bloc.dart';
import '../bloc/product/product_event.dart';
import '../data/models/screen_arguments/add_product_screen_arguments.dart';
import '../screens/product/add_product_screen.dart';
import '../screens/product/product_screen.dart';
import '../widgets/alert_dialogue_box.dart';
import 'constants/string_constants.dart';

class CustomDialogueUtils {
  static void errorFetchingProductDialogue(
    context,
    final String message,
  ) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialogueBox(
            title: StringConstants.kSomethingWentWrong,
            message: message.toString(),
            primaryButtonTitle: StringConstants.kOk,
            checkMarkVisible: false,
            primaryOnPressed: () {
              Navigator.pop(ctx);
            }));
  }

  static void errorFetchingCategoriesDialogue(
    context,
    final String message,
  ) {
    showDialog(
        context: context,
        builder: (context) => AlertDialogueBox(
            title: StringConstants.kSomethingWentWrong,
            message: message.toString(),
            primaryButtonTitle: StringConstants.kOk,
            errorMarkVisible: true,
            primaryOnPressed: () {
              Navigator.pop(context);
              Navigator.of(context)
                  .pushReplacementNamed(ProductScreen.routeName);
            }));
  }

  static void productSavedDialogue(
    context,
    final String productName,
    final String categoryName,
    final String brandName,
    final String productDescription,
    final int productId,
  ) {
    showDialog(
        context: context,
        builder: (context) => AlertDialogueBox(
            title: StringConstants.kNewProductAdded,
            message: StringConstants.kContinueAddingVariant,
            primaryButtonTitle: StringConstants.kAddVariantButton,
            checkMarkVisible: true,
            secondaryButtonTitle: StringConstants.kNo,
            primaryOnPressed: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(
                  context, AddProductScreen.routeName,
                  arguments: AddProductScreenArguments(
                      isEdit: false,
                      isVariant: true,
                      dataMap: {
                        'product_name': productName,
                        'category_name': categoryName,
                        'brand_name': brandName,
                        'product_id': productId,
                        'product_description': productDescription,
                      },
                      isProductDetail: false));
            },
            secondaryOnPressed: () {
              context.read<ProductBloc>().add(FetchProductList());
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, ProductScreen.routeName);
            }));
  }

  static void productEditedDialogue(
    context,
    final String message,
  ) {
    showDialog(
        context: context,
        builder: (dialogueCtx) => AlertDialogueBox(
            title: StringConstants.kNewProductAdded,
            message: message.toString(),
            primaryButtonTitle: StringConstants.kOk,
            checkMarkVisible: true,
            primaryOnPressed: () {
              Navigator.pop(dialogueCtx);
              Navigator.pushReplacementNamed(context, ProductScreen.routeName);
            }));
  }

  static void errorSavingProductDialogue(
    context,
    final String message,
  ) {
    showDialog(
        context: context,
        builder: (context) => AlertDialogueBox(
            title: StringConstants.kSomethingWentWrong,
            message: message.toString(),
            primaryButtonTitle: StringConstants.kOk,
            errorMarkVisible: true,
            primaryOnPressed: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, ProductScreen.routeName);
            }));
  }

  static void errorEditingProductDialogue(
    context,
    final String message,
  ) {
    showDialog(
        context: context,
        builder: (context) => AlertDialogueBox(
            title: StringConstants.kSomethingWentWrong,
            message: message.toString(),
            primaryButtonTitle: StringConstants.kOk,
            errorMarkVisible: true,
            primaryOnPressed: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, ProductScreen.routeName);
            }));
  }

  static void addNewProductDialogue(context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialogueBox(
            title: StringConstants.kAddNewProduct,
            message: StringConstants.kScanTheBarcode,
            primaryButtonTitle: StringConstants.kScanBarcode,
            secondaryButtonTitle: StringConstants.kAddManually,
            checkMarkVisible: false,
            secondaryOnPressed: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(
                  context, AddProductScreen.routeName,
                  arguments: AddProductScreenArguments(
                      isEdit: false,
                      isVariant: false,
                      dataMap: {},
                      isProductDetail: false));
            },
            primaryOnPressed: () {}));
  }

  static void errorDeletingProductDialogue(
    context,
    final String message,
  ) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialogueBox(
            title: StringConstants.kSomethingWentWrong,
            message: message.toString(),
            primaryButtonTitle: StringConstants.kOk,
            checkMarkVisible: false,
            primaryOnPressed: () {
              Navigator.pop(ctx);
            }));
  }

  static void deletedProductDialogue(
    context,
    final String message,
  ) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialogueBox(
              title: StringConstants.kSuccess,
              message: message.toString(),
              primaryButtonTitle: StringConstants.kOk,
              checkMarkVisible: false,
              primaryOnPressed: () {
                context.read<ProductBloc>().add(FetchProductList());
                ProductScreen.selectedIds = [];
                Navigator.pop(ctx);
              },
            ));
  }

  static void deleteProductWarningDialogue(
    context,
  ) {
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
              context
                  .read<ProductBloc>()
                  .add(DeleteProducts(variantIds: ProductScreen.selectedIds));
            }));
  }

  static void discardChangesWarningDialogue(
    context,
  ) {
    showDialog(
        context: context,
        builder: (context) => AlertDialogueBox(
              title: StringConstants.kWarning,
              message: StringConstants.kDiscardChanges,
              primaryButtonTitle: StringConstants.kConfirm,
              primaryOnPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(
                    context, ProductScreen.routeName);
              },
              secondaryButtonTitle: StringConstants.kCancel,
              secondaryOnPressed: () {
                Navigator.pop(context);
              },
            ));
  }
}
