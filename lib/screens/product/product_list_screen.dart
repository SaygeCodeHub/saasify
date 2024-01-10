import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/product/product_bloc.dart';
import 'package:saasify/bloc/product/product_event.dart';
import 'package:saasify/bloc/product/product_state.dart';
import 'package:saasify/configs/app_color.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/screen_arguments/add_product_screen_arguments.dart';
import 'package:saasify/screens/product/add_product_screen.dart';
import 'package:saasify/screens/product/widgets/product_list_data_table.dart';
import 'package:saasify/screens/product/widgets/product_list_mobile.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/utils/progress_bar.dart';
import 'package:saasify/utils/responsive.dart';
import 'package:saasify/widgets/custom_page_header.dart';
import 'package:saasify/widgets/sidebar.dart';
import 'package:saasify/widgets/top_bar.dart';
import '../../widgets/alert_dialogue_box.dart';
import 'final_add_product_screen.dart';

class ProductListScreen extends StatelessWidget {
  static const String routeName = 'ProductListScreen';

  static List<int> selectedIds = [];

  ProductListScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    context.read<ProductBloc>().add(FetchProductList());
    return Scaffold(
        key: _scaffoldKey,
        drawer: const SideBar(selectedIndex: 3),
        body: Flex(
            crossAxisAlignment: CrossAxisAlignment.start,
            direction:
                context.responsive(Axis.vertical, desktop: Axis.horizontal),
            children: [
              context.responsive(
                  TopBar(
                      scaffoldKey: _scaffoldKey,
                      headingText: StringConstants.kProducts),
                  desktop: const Expanded(
                    child: SideBar(selectedIndex: 3),
                  )),
              Expanded(
                  flex: 5,
                  child: Padding(
                      padding: const EdgeInsets.all(spacingLarge),
                      child: BlocConsumer<ProductBloc, ProductStates>(
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
                                        context
                                            .read<ProductBloc>()
                                            .add(FetchProductList());
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
                                      title:
                                          StringConstants.kSomethingWentWrong,
                                      message: state.message,
                                      primaryButtonTitle: StringConstants.kOk,
                                      checkMarkVisible: false,
                                      primaryOnPressed: () {
                                        Navigator.pop(ctx);
                                      },
                                    ));
                          }
                          if (state is EditingProduct) {
                            ProgressBar.show(context);
                          }
                          if (state is EditedProduct) {
                            ProgressBar.dismiss(context);
                            context.read<ProductBloc>().add(FetchProductList());
                          }
                          if (state is ErrorEditingProduct) {
                            ProgressBar.dismiss(context);
                            showDialog(
                                context: context,
                                builder: (ctx) => AlertDialogueBox(
                                      title:
                                          StringConstants.kSomethingWentWrong,
                                      message: state.message,
                                      primaryButtonTitle: StringConstants.kOk,
                                      checkMarkVisible: false,
                                      primaryOnPressed: () {
                                        Navigator.pop(ctx);
                                      },
                                    ));
                          }
                          if (state is ErrorFetchingProduct) {
                            showDialog(
                                context: context,
                                builder: (ctx) => AlertDialogueBox(
                                      title:
                                          StringConstants.kSomethingWentWrong,
                                      message: state.message,
                                      primaryButtonTitle: StringConstants.kOk,
                                      checkMarkVisible: false,
                                      primaryOnPressed: () {
                                        Navigator.pop(ctx);
                                      },
                                    ));
                          }
                        },
                        buildWhen: (prev, curr) {
                          return curr is FetchingProduct ||
                              curr is FetchedProduct ||
                              curr is ErrorFetchingProduct;
                        },
                        builder: (context, state) {
                          if (state is FetchingProduct) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (state is FetchedProduct) {
                            return Column(
                              children: [
                                CustomPageHeader(
                                    titleText: StringConstants.kProducts,
                                    buttonVisible: true,
                                    buttonTitle: StringConstants.kAddProduct,
                                    utilityVisible: true,
                                    deleteIconVisible: selectedIds.isNotEmpty,
                                    deleteOnPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) =>
                                              AlertDialogueBox(
                                                title: StringConstants.kWarning,
                                                message: StringConstants
                                                    .kTheSelectedProducts,
                                                primaryButtonTitle:
                                                    StringConstants.kConfirm,
                                                secondaryButtonTitle:
                                                    StringConstants.kCancel,
                                                checkMarkVisible: false,
                                                secondaryOnPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                primaryOnPressed: () {
                                                  Navigator.pop(context);
                                                  context
                                                      .read<ProductBloc>()
                                                      .add(DeleteProducts(
                                                          variantIds:
                                                              selectedIds));
                                                },
                                              ));
                                    },
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) =>
                                              AlertDialogueBox(
                                                title: StringConstants
                                                    .kAddNewProduct,
                                                message: StringConstants
                                                    .kScanTheBarcode,
                                                primaryButtonTitle:
                                                    StringConstants
                                                        .kScanBarcode,
                                                secondaryButtonTitle:
                                                    StringConstants
                                                        .kAddManually,
                                                checkMarkVisible: false,
                                                secondaryOnPressed: () {
                                                  Navigator.pop(context);
                                                  Navigator.pushReplacementNamed(
                                                      context,
                                                      AddProductScreen
                                                          .routeName,
                                                      arguments:
                                                          AddProductScreenArguments(
                                                              isEdit: false,
                                                              isVariant: false,
                                                              dataMap: {},
                                                              isProductDetail:
                                                                  false));
                                                },
                                                primaryOnPressed: () {},
                                              ));
                                    }),
                                const SizedBox(height: spacingStandard),
                                // ProductListDataTable(
                                //     productList: state.productList),

                                ProductListMobile(
                                    productList: state.productList),
                                // LayoutBuilder(builder: (BuildContext context,
                                //     BoxConstraints constraints) {
                                //   return (constraints.maxWidth < 600)
                                //       ? ProductListMobile(
                                //           productList: state.productList)
                                //       : ProductListDataTable(
                                //           productList: state.productList);
                                // }),
                                Visibility(
                                    visible: state.productList.isEmpty,
                                    child: Center(
                                        child: Text(
                                            StringConstants.kNoDataAvailable,
                                            style: Theme.of(context)
                                                .textTheme
                                                .tinier
                                                .copyWith(
                                                    color: AppColor
                                                        .saasifyLightGrey)))),
                                Visibility(
                                    visible: state.productList.isEmpty,
                                    child: const Spacer())
                              ],
                            );
                          } else if (state is ErrorFetchingProduct) {
                            return Center(
                                child: Text(StringConstants.kNoDataAvailable,
                                    style: Theme.of(context)
                                        .textTheme
                                        .tinier
                                        .copyWith(
                                            color: AppColor.saasifyLightGrey)));
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      )))
            ]));
  }
}
