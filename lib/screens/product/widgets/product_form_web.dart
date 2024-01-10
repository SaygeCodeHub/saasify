import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/product/product_bloc.dart';
import 'package:saasify/bloc/product/product_event.dart';
import 'package:saasify/bloc/upload/upload_bloc.dart';
import 'package:saasify/bloc/upload/upload_events.dart';
import 'package:saasify/configs/app_color.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/products/fetch_all_categories_model.dart';
import 'package:saasify/data/models/screen_arguments/add_product_screen_arguments.dart';
import 'package:saasify/screens/product/product_list_screen.dart';
import 'package:saasify/screens/product/widgets/product_form_image_section.dart';
import 'package:saasify/screens/product/widgets/product_form_section1.dart';
import 'package:saasify/screens/product/widgets/product_form_section2.dart';
import 'package:saasify/screens/product/widgets/product_form_section3.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/utils/responsive.dart';
import 'package:saasify/widgets/alert_dialogue_box.dart';
import 'package:saasify/widgets/primary_button.dart';
import 'package:saasify/widgets/secondary_button.dart';
import 'package:saasify/widgets/toggle_switch_widget.dart';

import '../add_product_screen.dart';

class ProductFormWeb extends StatelessWidget {
  const ProductFormWeb(
      {super.key,
      required GlobalKey<FormState> formKey,
      required this.isVariant,
      required this.isEdit,
      required this.dataMap,
      required this.categoryList,
      required this.isProductDetail})
      : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final bool isVariant;
  final bool isEdit;
  final Map dataMap;
  final bool isProductDetail;
  final List<ProductCategory> categoryList;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                    onTap: () {
                      (isProductDetail == true)
                          ? Navigator.pushReplacementNamed(
                              context, ProductListScreen.routeName)
                          : showDialog(
                              context: context,
                              builder: (context) => AlertDialogueBox(
                                    title: StringConstants.kWarning,
                                    message:
                                        'Do you want to discard the changes',
                                    primaryButtonTitle:
                                        StringConstants.kConfirm,
                                    primaryOnPressed: () {
                                      Navigator.pop(context);
                                      Navigator.pushReplacementNamed(
                                          context, ProductListScreen.routeName);
                                    },
                                    secondaryButtonTitle:
                                        StringConstants.kCancel,
                                    secondaryOnPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ));
                    },
                    child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(Icons.arrow_back_ios_new))),
                const SizedBox(width: spacingSmall),
                context.responsive(const SizedBox.shrink(),
                    desktop: Text(
                        (isVariant == true)
                            ? StringConstants.kAddVariant
                            : (isEdit)
                                ? 'Edit Product'
                                : (isProductDetail == true)
                                    ? StringConstants.kProductDetails
                                    : StringConstants.kAddProduct,
                        style: Theme.of(context)
                            .textTheme
                            .xxTiny
                            .copyWith(fontWeight: FontWeight.w700)))
              ],
            ),
            Visibility(
                visible: isEdit || isProductDetail,
                child: SizedBox(
                    width: kGeneralActionButtonWidth,
                    child: PrimaryButton(
                        onPressed: () {
                          (isProductDetail == true)
                              ? Navigator.pushReplacementNamed(
                                  context, AddProductScreen.routeName,
                                  arguments: AddProductScreenArguments(
                                      isEdit: true,
                                      isVariant: false,
                                      dataMap: dataMap,
                                      isProductDetail: false))
                              : Navigator.pushReplacementNamed(
                                  context, AddProductScreen.routeName,
                                  arguments: AddProductScreenArguments(
                                      isEdit: false,
                                      isVariant: true,
                                      dataMap: {
                                        'product_name': dataMap['product_name'],
                                        'category_name':
                                            dataMap['category_name'],
                                        'brand_name': dataMap['brand_name'],
                                        'product_id': dataMap['product_id'],
                                        'product_description':
                                            dataMap['product_description'],
                                      },
                                      isProductDetail: false));
                        },
                        buttonTitle: (isProductDetail == true)
                            ? 'Edit Product Details'
                            : 'Add Variant')))
          ],
        ),
        const SizedBox(height: spacingStandard),
        Visibility(
            visible: isEdit,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 8),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(kCircularRadius),
                            color: (dataMap['draft'] ?? false)
                                ? AppColor.saasifyLightWhiteGrey
                                : AppColor.saasifyLighterGreen),
                        child: Row(mainAxisSize: MainAxisSize.min, children: [
                          Icon(Icons.circle,
                              size: 8,
                              color: (dataMap['draft'] ?? false)
                                  ? AppColor.saasifyLightGrey
                                  : AppColor.saasifyGreen),
                          const SizedBox(width: 6),
                          Text(
                              (dataMap['draft'] ?? false)
                                  ? 'Draft'
                                  : 'Published',
                              style: Theme.of(context)
                                  .textTheme
                                  .xxTiniest
                                  .copyWith(
                                      color: (dataMap['draft'] ?? false)
                                          ? AppColor.saasifyLightGrey
                                          : AppColor.saasifyGreen))
                        ]))
                  ]),
                  Row(children: [
                    const Text(StringConstants.kWantToDeactivateProduct),
                    ToggleSwitchWidget(
                        activeColor: AppColor.saasifyLightDeepBlue,
                        value: dataMap['variant_active'] ?? true,
                        onChanged: (value) {
                          dataMap['variant_active'] = value;
                          context
                              .read<ProductBloc>()
                              .add(LoadForm(categoryList: categoryList));
                        })
                  ])
                ])),
        const SizedBox(height: spacingXHuge),
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ProductFormSection1(
              isVariant: isVariant,
              isEdit: isEdit,
              dataMap: dataMap,
              categoryList: categoryList,
              isProductDetail: isProductDetail),
          const SizedBox(width: spacingXXHuge),
          ProductFormSection2(
              isVariant: isVariant,
              isEdit: isEdit,
              dataMap: dataMap,
              isProductDetail: isProductDetail,
              categoryList: categoryList),
          const SizedBox(width: spacingXXHuge),
          ProductFormSection3(
              isVariant: isVariant,
              isEdit: isEdit,
              dataMap: dataMap,
              isProductDetail: isProductDetail,
              categoryList: categoryList)
        ]),
        const SizedBox(height: spacingHuge),
        FormImageSection(
            isEdit: isEdit, dataMap: dataMap, isProductDetail: isProductDetail),
        const SizedBox(height: spacingMedium),
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          Visibility(
            visible: dataMap['draft'] != false,
            child: SecondaryButton(
                onPressed: () {
                  dataMap['draft'] = true;
                  if (_formKey.currentState!.validate()) {
                    if (context
                        .read<UploadBloc>()
                        .displayImageList
                        .isNotEmpty) {
                      if (context
                          .read<UploadBloc>()
                          .pickedImageList
                          .isNotEmpty) {
                        context.read<UploadBloc>().add(UploadImage(
                            multiplePartFileList:
                                context.read<UploadBloc>().pickedFiles));
                      }
                    } else {
                      dataMap['images'] = [];
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
                  }
                },
                buttonWidth: spacingXXXXHuge,
                buttonTitle: StringConstants.kSave),
          ),
          const SizedBox(width: spacingLarge),
          (isProductDetail == true)
              ? const SizedBox()
              : PrimaryButton(
                  onPressed: () {
                    dataMap['draft'] = false;
                    if (_formKey.currentState!.validate()) {
                      if (context
                          .read<UploadBloc>()
                          .displayImageList
                          .isNotEmpty) {
                        if (context
                            .read<UploadBloc>()
                            .pickedImageList
                            .isNotEmpty) {
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
        ]),
        const SizedBox(height: spacingMedium)
      ]),
    );
  }
}
