import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/product/product_bloc.dart';
import 'package:saasify/bloc/product/product_event.dart';
import 'package:saasify/bloc/upload/upload_bloc.dart';
import 'package:saasify/bloc/upload/upload_events.dart';
import 'package:saasify/screens/product/widgets/add_product_screen_mobile.dart';
import 'package:saasify/screens/product/widgets/add_product_screen_web.dart';
import 'package:saasify/utils/responsive.dart';
import '../../bloc/product/product_state.dart';
import '../../utils/constants/string_constants.dart';
import '../../utils/custom_dialogue_util.dart';
import '../../utils/progress_bar.dart';
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
                      CustomDialogueUtils.errorFetchingCategoriesDialogue(
                          context, state.message);
                    } else if (state is SavingProduct) {
                      ProgressBar.show(context);
                    } else if (state is EditingProduct) {
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
                    } else if (state is EditedProduct) {
                      ProgressBar.dismiss(context);
                      CustomDialogueUtils.productEditedDialogue(
                          context, state.message);
                    } else if (state is ErrorSavingProduct) {
                      ProgressBar.dismiss(context);
                      CustomDialogueUtils.errorSavingProductDialogue(
                          context, state.message);
                    } else if (state is ErrorEditingProduct) {
                      ProgressBar.dismiss(context);
                      CustomDialogueUtils.errorEditingProductDialogue(
                          context, state.message);
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
