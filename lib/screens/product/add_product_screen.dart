import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/product/product_bloc.dart';
import 'package:saasify/bloc/product/product_event.dart';
import 'package:saasify/bloc/upload/upload_bloc.dart';
import 'package:saasify/bloc/upload/upload_events.dart';
import 'package:saasify/screens/product/product_screen.dart';
import 'package:saasify/screens/product/widgets/add_product_screen_mobile.dart';
import 'package:saasify/screens/product/widgets/add_product_screen_web.dart';
import 'package:saasify/utils/responsive.dart';
import '../../bloc/product/product_state.dart';
import '../../data/models/screen_arguments/add_product_screen_arguments.dart';
import '../../utils/constants/string_constants.dart';
import '../../utils/progress_bar.dart';
import '../../widgets/alert_dialogue_box.dart';
import '../../widgets/sidebar.dart';
import '../../widgets/top_bar.dart';

class AddProductScreen extends StatelessWidget {
  static const String routeName = 'AddProductScreen';

  final bool isEdit;
  final bool isVariant;
  final Map dataMap;
  final bool isProductDetail;

  AddProductScreen(
      {super.key,
      required this.isEdit,
      required this.isVariant,
      required this.dataMap,
      required this.isProductDetail});

  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    context.read<UploadBloc>().pickedImageList.clear();
    context.read<UploadBloc>().displayImageList.clear();
    if (isEdit) {
      context.read<UploadBloc>().displayImageList.addAll(dataMap['images']);
    }
    context.read<ProductBloc>().add(FetchAllCategories());
    context.read<UploadBloc>().add(LoadImage());
    return Scaffold(
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
                                    ProductScreen.routeName);
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
                                            'product_name':
                                                state.data.productName,
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
                                      context, ProductScreen.routeName);
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
                                    context, ProductScreen.routeName);
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
                                    context, ProductScreen.routeName);
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
                                    context, ProductScreen.routeName);
                              }));
                    }
                  }, buildWhen: (prev, curr) {
                    return curr is FetchingCategories ||
                        curr is FetchedCategories;
                  }, builder: (context, state) {
                    if (state is FetchingCategories) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state is FetchedCategories) {
                      return LayoutBuilder(builder:
                          (BuildContext context, BoxConstraints constraints) {
                        return (constraints.maxWidth < 600)
                            ? AddProductScreenMobile(
                                isEdit: isEdit,
                                isVariant: isVariant,
                                dataMap: dataMap,
                                isProductDetail: isProductDetail,
                                formKey: _formKey,
                                categoryList: state.categoryList)
                            : AddProductScreenWeb(
                                isEdit: isEdit,
                                isVariant: isVariant,
                                dataMap: dataMap,
                                isProductDetail: isProductDetail,
                                formKey: _formKey,
                                categoryList: state.categoryList);
                      });
                    } else {
                      return const SizedBox.shrink();
                    }
                  }))
            ]));
  }
}
