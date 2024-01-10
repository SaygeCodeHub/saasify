import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/screens/product/product_list_screen.dart';
import 'package:saasify/screens/product/widgets/product_form_web.dart';
import 'package:saasify/utils/responsive.dart';
import '../../bloc/product/product_bloc.dart';
import '../../bloc/product/product_event.dart';
import '../../bloc/product/product_state.dart';
import '../../configs/app_dimensions.dart';
import '../../configs/app_spacing.dart';
import '../../data/models/screen_arguments/add_product_screen_arguments.dart';
import '../../utils/constants/string_constants.dart';
import '../../utils/progress_bar.dart';
import '../../widgets/alert_dialogue_box.dart';
import '../../widgets/sidebar.dart';
import '../../widgets/top_bar.dart';
import 'add_product_screen.dart';

class AddProductScreenWeb extends StatelessWidget {
  final GlobalKey<FormState> _formKey;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final bool isEdit;
  final bool isVariant;
  final Map dataMap;
  final bool isProductDetail;

  AddProductScreenWeb({
    super.key,
    required this.isEdit,
    required this.isVariant,
    required this.dataMap,
    required this.isProductDetail,
    required GlobalKey<FormState> formKey,
    required GlobalKey<ScaffoldState> scaffoldKey,
  }) : _formKey = formKey;

  @override
  Widget build(BuildContext context) {
    return Flex(
        crossAxisAlignment: CrossAxisAlignment.start,
        direction: context.responsive(Axis.vertical, desktop: Axis.horizontal),
        children: [
          context.responsive(
              TopBar(
                  scaffoldKey: _scaffoldKey,
                  headingText: (isVariant == true)
                      ? StringConstants.kAddVariant
                      : (isEdit)
                          ? 'Edit Product'
                          : StringConstants.kAddProduct),
              desktop: const Expanded(child: SideBar(selectedIndex: 3))),
          Expanded(
              flex: 5,
              child: BlocConsumer<ProductBloc, ProductStates>(
                  listener: (context, state) {
                if (state is ErrorFetchingCategories) {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialogueBox(
                          title: StringConstants.kSomethingWentWrong,
                          message: state.message,
                          primaryButtonTitle: StringConstants.kOk,
                          errorMarkVisible: true,
                          primaryOnPressed: () {
                            Navigator.pop(context);
                            Navigator.of(context).pushReplacementNamed(
                                ProductListScreen.routeName);
                          }));
                } else if (state is SavingProduct) {
                  ProgressBar.show(context);
                } else if (state is EditingProduct) {
                  ProgressBar.show(context);
                } else if (state is SavedProduct) {
                  ProgressBar.dismiss(context);
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialogueBox(
                            title: StringConstants.kNewProductAdded,
                            message: StringConstants.kContinueAddingVariant,
                            primaryButtonTitle:
                                StringConstants.kAddVariantButton,
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
                                        'product_name': state.data.productName,
                                        'category_name':
                                            state.data.categoryName,
                                        'brand_name': state.data.brandName,
                                        'product_id': state.data.productId,
                                        'product_description':
                                            state.data.productDescription,
                                      },
                                      isProductDetail: false));
                            },
                            secondaryOnPressed: () {
                              context
                                  .read<ProductBloc>()
                                  .add(FetchProductList());
                              Navigator.pop(context);
                              Navigator.pushReplacementNamed(
                                  context, ProductListScreen.routeName);
                              // Navigator.pop(context);
                            },
                          ));
                } else if (state is EditedProduct) {
                  ProgressBar.dismiss(context);
                  showDialog(
                      context: context,
                      builder: (dialogueCtx) => AlertDialogueBox(
                          title: StringConstants.kNewProductAdded,
                          message: state.message,
                          primaryButtonTitle: StringConstants.kOk,
                          checkMarkVisible: true,
                          primaryOnPressed: () {
                            Navigator.pop(dialogueCtx);
                            Navigator.pushReplacementNamed(
                                context, ProductListScreen.routeName);
                          }));
                } else if (state is ErrorSavingProduct) {
                  ProgressBar.dismiss(context);
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialogueBox(
                          title: StringConstants.kSomethingWentWrong,
                          message: state.message,
                          primaryButtonTitle: StringConstants.kOk,
                          errorMarkVisible: true,
                          primaryOnPressed: () {
                            Navigator.pop(context);
                            Navigator.pushReplacementNamed(
                                context, ProductListScreen.routeName);
                          }));
                } else if (state is ErrorEditingProduct) {
                  ProgressBar.dismiss(context);
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialogueBox(
                          title: StringConstants.kSomethingWentWrong,
                          message: state.message,
                          primaryButtonTitle: StringConstants.kOk,
                          errorMarkVisible: true,
                          primaryOnPressed: () {
                            Navigator.pop(context);
                            Navigator.pushReplacementNamed(
                                context, ProductListScreen.routeName);
                          }));
                }
              }, buildWhen: (prev, curr) {
                return curr is FetchingCategories || curr is FetchedCategories;
              }, builder: (context, state) {
                if (state is FetchingCategories) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is FetchedCategories) {
                  return Padding(
                      padding: const EdgeInsets.only(
                          top: spacingXXLarge,
                          left: spacingXHuge,
                          right: kHelloSpacingHeight),
                      child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: ProductFormWeb(
                              formKey: _formKey,
                              isVariant: isVariant,
                              isEdit: isEdit,
                              dataMap: dataMap,
                              categoryList: state.categoryList,
                              isProductDetail: isProductDetail)));
                } else {
                  return const SizedBox.shrink();
                }
              }))
        ]);
  }
}
