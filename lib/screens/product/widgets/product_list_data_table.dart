import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/product/product_bloc.dart';
import 'package:saasify/bloc/product/product_event.dart';
import 'package:saasify/configs/app_color.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/products/product_list_model.dart';
import 'package:saasify/data/models/screen_arguments/add_product_screen_arguments.dart';
import 'package:saasify/screens/product/add_product_screen.dart';
import 'package:saasify/screens/product/product_list_screen.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/custom_table.dart';
import 'package:saasify/widgets/toggle_switch_widget.dart';

class ProductListDataTable extends StatelessWidget {
  final List<ProductWithVariant> productList;

  const ProductListDataTable({Key? key, required this.productList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomDataTable(
        columnList: const [
          StringConstants.kName,
          StringConstants.kBarcode,
          StringConstants.kCategory,
          StringConstants.kBrand,
          StringConstants.kPrice,
          StringConstants.kStock,
          '',
          '',
          ''
        ],
        selectedIds: ProductListScreen.selectedIds,
        dataCount: productList.length,
        dataIds: List.generate(
            productList.length, (index) => productList[index].variantId),
        onHeaderCheckboxChange: () {
          if (ProductListScreen.selectedIds.length < productList.length) {
            ProductListScreen.selectedIds =
                productList.map((e) => e.variantId).toList();
          } else {
            ProductListScreen.selectedIds.clear();
          }
          context
              .read<ProductBloc>()
              .add(ProductSelected(productList: productList));
        },
        onRowCheckboxChange: (index) {
          (ProductListScreen.selectedIds.contains(productList[index].variantId))
              ? ProductListScreen.selectedIds
                  .remove(productList[index].variantId)
              : ProductListScreen.selectedIds.add(productList[index].variantId);
          context
              .read<ProductBloc>()
              .add(ProductSelected(productList: productList));
        },
        generateData: (index) {
          return [
            DataCell(
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(productList[index].productName,
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.xxTiniest),
                ), onTap: () {
              Navigator.pushReplacementNamed(
                  context, AddProductScreen.routeName,
                  arguments: AddProductScreenArguments(
                      isEdit: false,
                      isVariant: false,
                      dataMap: productList[index].toJson(),
                      isProductDetail: true));
            }),
            DataCell(
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(productList[index].barcode.toString(),
                        style: Theme.of(context).textTheme.xxTiniest)),
                onTap: () {
              Navigator.pushReplacementNamed(
                  context, AddProductScreen.routeName,
                  arguments: AddProductScreenArguments(
                      isEdit: false,
                      isVariant: false,
                      dataMap: productList[index].toJson(),
                      isProductDetail: true));
            }),
            DataCell(
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(productList[index].categoryName,
                        style: Theme.of(context).textTheme.xxTiniest)),
                onTap: () {
              Navigator.pushReplacementNamed(
                  context, AddProductScreen.routeName,
                  arguments: AddProductScreenArguments(
                      isEdit: false,
                      isVariant: false,
                      dataMap: productList[index].toJson(),
                      isProductDetail: true));
            }),
            DataCell(
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(productList[index].brandName ?? '',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.xxTiniest)),
                onTap: () {
              Navigator.pushReplacementNamed(
                  context, AddProductScreen.routeName,
                  arguments: AddProductScreenArguments(
                      isEdit: false,
                      isVariant: false,
                      dataMap: productList[index].toJson(),
                      isProductDetail: true));
            }),
            DataCell(
                Text(
                    '${productList[index].currency} ${productList[index].cost}',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.xxTiniest), onTap: () {
              Navigator.pushReplacementNamed(
                  context, AddProductScreen.routeName,
                  arguments: AddProductScreenArguments(
                      isEdit: false,
                      isVariant: false,
                      dataMap: productList[index].toJson(),
                      isProductDetail: true));
            }),
            DataCell(
                Text(productList[index].stock.toString(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.xxTiniest.copyWith(
                        color: (productList[index].stock != null &&
                                productList[index].restockReminder != null)
                            ? ((productList[index].stock ?? 0) <
                                    (productList[index].restockReminder ?? 0))
                                ? AppColor.saasifyRed
                                : AppColor.saasifyBlack
                            : AppColor.saasifyBlack)), onTap: () {
              Navigator.pushReplacementNamed(
                  context, AddProductScreen.routeName,
                  arguments: AddProductScreenArguments(
                      isEdit: false,
                      isVariant: false,
                      dataMap: productList[index].toJson(),
                      isProductDetail: true));
            }),
            DataCell(Container(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: (productList[index].draft)
                        ? AppColor.saasifyLighterGrey
                        : AppColor.saasifyLighterGreen),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.circle,
                        size: 8,
                        color: (productList[index].draft)
                            ? AppColor.saasifyLightGrey
                            : AppColor.saasifyGreen),
                    const SizedBox(width: 6),
                    Text((productList[index].draft) ? 'Draft' : 'Published',
                        style: Theme.of(context).textTheme.xxTiniest.copyWith(
                            color: (productList[index].draft)
                                ? AppColor.saasifyLightGrey
                                : AppColor.saasifyGreen)),
                  ],
                ))),
            DataCell(ToggleSwitchWidget(
                activeColor: AppColor.saasifyLightDeepBlue,
                value: (productList[index].draft)
                    ? false
                    : productList[index].variantActive,
                onChanged: (productList[index].draft)
                    ? null
                    : (value) {
                        Map productDetails = productList[index].toJson();
                        productDetails['variant_active'] = value;
                        context.read<ProductBloc>().add(
                            EditProduct(productDetailsMap: productDetails));
                      })),
            DataCell(IconButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, AddProductScreen.routeName,
                      arguments: AddProductScreenArguments(
                          isEdit: true,
                          isVariant: false,
                          dataMap: productList[index].toJson(),
                          isProductDetail: false));
                },
                icon: const Icon(
                  Icons.edit,
                  size: spacingStandard,
                )))
          ];
        });
  }
}
