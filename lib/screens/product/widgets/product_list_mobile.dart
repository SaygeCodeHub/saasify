import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/configs/app_theme.dart';

import '../../../bloc/product/product_bloc.dart';
import '../../../bloc/product/product_event.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_colors.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/products/product_list_model.dart';
import '../../../data/models/screen_arguments/add_product_screen_arguments.dart';
import '../../../widgets/toggle_switch_widget.dart';
import '../add_product_screen.dart';
import '../final_add_product_screen.dart';

class ProductListMobile extends StatelessWidget {
  final List<ProductWithVariant> productList;

  const ProductListMobile({super.key, required this.productList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, AddProductScreen.routeName,
                    arguments: AddProductScreenArguments(
                        isEdit: false,
                        isVariant: false,
                        dataMap: productList[index].toJson(),
                        isProductDetail: true));
              },
              child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.lightGrey,
                      borderRadius: BorderRadius.circular(kCircularRadius)),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.178,
                            width: MediaQuery.sizeOf(context).width * 0.2,
                            child: Image.network(
                                productList[index].images[0].toString(),
                                fit: BoxFit.fitHeight)),
                        Expanded(
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    left: spacingXMedium,
                                    right: spacingXMedium,
                                    top: spacingXXSmall),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(children: [
                                              Text('Category : ',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .xTiniest
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              AppColors.black),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  softWrap: false),
                                              Text(
                                                  productList[index]
                                                      .categoryName,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .xTiniest
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              AppColors.black),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  softWrap: false)
                                            ]),
                                            Text(
                                                productList[index].brandName ??
                                                    '',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .xTiniest
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: AppColors.black),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                softWrap: false)
                                          ]),
                                      Text(productList[index].productName,
                                          style: Theme.of(context)
                                              .textTheme
                                              .xTiniest
                                              .copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.black),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: false),
                                      Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text('Barcode : ',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .xxTiniest
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: AppColors.black),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                softWrap: false),
                                            Text(
                                                productList[index]
                                                    .barcode
                                                    .toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .xxTiniest
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: AppColors.black),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                softWrap: false)
                                          ]),
                                      Row(children: [
                                        Text(
                                            productList[index]
                                                .currency
                                                .toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .xxTiniest
                                                .copyWith(
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.black),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: false),
                                        const SizedBox(width: spacingSmallest),
                                        Text(productList[index].cost.toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .tiniest
                                                .copyWith(
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.black),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: false)
                                      ]),
                                      const SizedBox(height: spacingXSmall),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text('Stock : ',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .xxTiniest
                                                    .copyWith(
                                                        color: AppColors.black),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                softWrap: false),
                                            Text(
                                                productList[index]
                                                    .stock
                                                    .toString(),
                                                textAlign: TextAlign.center,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .xxTiniest
                                                    .copyWith(
                                                        color: (productList[index]
                                                                        .stock !=
                                                                    null &&
                                                                productList[index]
                                                                        .restockReminder !=
                                                                    null)
                                                            ? ((productList[index]
                                                                            .stock ??
                                                                        0) <
                                                                    (productList[index]
                                                                            .restockReminder ??
                                                                        0))
                                                                ? AppColor
                                                                    .saasifyRed
                                                                : AppColor
                                                                    .saasifyGreen
                                                            : AppColor
                                                                .saasifyGreen))
                                          ]),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 4,
                                                        horizontal: 8),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    color: (productList[index]
                                                            .draft)
                                                        ? AppColor
                                                            .saasifyLightWhiteGrey
                                                        : AppColor
                                                            .saasifyLighterGreen),
                                                child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Icon(Icons.circle,
                                                          size: 8,
                                                          color: (productList[
                                                                      index]
                                                                  .draft)
                                                              ? AppColor
                                                                  .saasifyLightGrey
                                                              : AppColor
                                                                  .saasifyGreen),
                                                      const SizedBox(width: 6),
                                                      Text(
                                                          (productList[index]
                                                                  .draft)
                                                              ? 'Draft'
                                                              : 'Published',
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .xxTiniest
                                                              .copyWith(
                                                                  color: (productList[
                                                                              index]
                                                                          .draft)
                                                                      ? AppColor
                                                                          .saasifyLightGrey
                                                                      : AppColor
                                                                          .saasifyGreen))
                                                    ])),
                                            ToggleSwitchWidget(
                                                activeColor: AppColor
                                                    .saasifyLightDeepBlue,
                                                value:
                                                    (productList[index].draft)
                                                        ? false
                                                        : productList[index]
                                                            .variantActive,
                                                onChanged: (productList[index]
                                                        .draft)
                                                    ? null
                                                    : (value) {
                                                        Map productDetails =
                                                            productList[index]
                                                                .toJson();
                                                        productDetails[
                                                                'variant_active'] =
                                                            value;
                                                        context
                                                            .read<ProductBloc>()
                                                            .add(EditProduct(
                                                                productDetailsMap:
                                                                    productDetails));
                                                      })
                                          ])
                                    ])))
                      ])),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const SizedBox(height: 30),
          itemCount: productList.length),
    );
  }
}
