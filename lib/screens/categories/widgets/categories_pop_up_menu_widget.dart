import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/widgets/toggle_switch_widget.dart';
import '../../../bloc/categories/categories_bloc.dart';
import '../../../bloc/categories/categories_event.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/categories/fetch_all_categories_model.dart';
import '../../../utils/constants/string_constants.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/primary_button.dart';
import '../../../widgets/secondary_button.dart';

class CategoriesPopUpMenuWidget extends StatelessWidget {
  final ProductCategory productCategory;

  const CategoriesPopUpMenuWidget({super.key, required this.productCategory});

  @override
  Widget build(BuildContext context) {
    Map editCategoryMap = productCategory.toJson();

    return PopupMenuButton(
        itemBuilder: (context) {
          return [
            PopupMenuItem(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                          content: SizedBox(
                              width: kDialogueWidth,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(StringConstants.kEditCategory,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .xTiniest
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w700)),
                                          InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Align(
                                                  alignment: Alignment.topRight,
                                                  child: Icon(Icons.close,
                                                      color: AppColor
                                                          .saasifyGrey)))
                                        ]),
                                    const SizedBox(height: spacingMedium),
                                    Text(StringConstants.kCategoryName,
                                        style: Theme.of(context)
                                            .textTheme
                                            .xTiniest),
                                    const SizedBox(height: spacingXXSmall),
                                    CustomTextField(
                                        initialValue:
                                            productCategory.categoryName,
                                        onTextFieldChanged: (value) {
                                          editCategoryMap['category_name'] =
                                              value;
                                        }),
                                    const SizedBox(height: spacingSmall),
                                    Text(StringConstants.kEnterGSTAmount,
                                        style: Theme.of(context)
                                            .textTheme
                                            .xTiniest),
                                    const SizedBox(height: spacingXXSmall),
                                    CustomTextField(
                                        initialValue: "12%",
                                        onTextFieldChanged: (value) {}),
                                    Row(children: [
                                      Text(
                                          StringConstants
                                              .kDoYouWantToDeactivateGST,
                                          style: Theme.of(context)
                                              .textTheme
                                              .xTiniest),
                                      ToggleSwitchWidget(
                                          value: true, onChanged: (value) {})
                                    ]),
                                    const SizedBox(height: spacingXMedium),
                                    Row(children: [
                                      Expanded(
                                          child: SecondaryButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              buttonTitle:
                                                  StringConstants.kCancel)),
                                      const SizedBox(width: spacingXXSmall),
                                      Expanded(
                                          child: PrimaryButton(
                                              onPressed: () {
                                                context
                                                    .read<CategoriesBloc>()
                                                    .add(EditCategories(
                                                        categoryDetailsMap:
                                                            editCategoryMap));
                                                Navigator.pop(ctx);
                                              },
                                              buttonTitle:
                                                  StringConstants.kSave))
                                    ])
                                  ]))));
                },
                child: const Text(StringConstants.kEdit)),
            PopupMenuItem(
                onTap: () {
                  // showDialog(
                  //     context: context,
                  //     builder: (context) => CustomAlertDialog(
                  //         title: StringConstants.kWarning,
                  //         message: StringConstants.kDeleteCategory,
                  //         primaryButtonTitle: StringConstants.kConfirm,
                  //         primaryOnPressed: () {
                  //           context.read<CategoriesBloc>().add(DeleteCategories(
                  //               categoryId: productCategory.categoryId));
                  //           Navigator.pop(context);
                  //         },
                  //         secondaryButtonTitle: StringConstants.kCancel,
                  //         secondaryOnPressed: () {
                  //           Navigator.pop(context);
                  //         }));
                },
                child: const Text(StringConstants.kDelete))
          ];
        },
        child: const Icon(Icons.more_vert));
  }
}
