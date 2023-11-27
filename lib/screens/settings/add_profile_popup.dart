import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';
import '../../configs/app_color.dart';
import '../../configs/app_dimensions.dart';
import '../../configs/app_spacing.dart';
import '../../utils/constants/string_constants.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/secondary_button.dart';

class AddProfilePopup extends StatelessWidget {
  const AddProfilePopup({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: SizedBox(
            width: kDialogueWidth,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(StringConstants.kAddNewCategory,
                          style: Theme.of(context)
                              .textTheme
                              .xTiniest
                              .copyWith(fontWeight: FontWeight.w700)),
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Align(
                            alignment: Alignment.topRight,
                            child:
                                Icon(Icons.close, color: AppColor.saasifyGrey),
                          )),
                    ],
                  ),
                  const SizedBox(height: spacingMedium),
                  Text(StringConstants.kCategoryName,
                      style: Theme.of(context).textTheme.xTiniest),
                  const SizedBox(height: spacingXXSmall),
                  CustomTextField(onTextFieldChanged: (value) {}),
                  const SizedBox(height: spacingSmall),
                  Text(StringConstants.kEnterGSTAmount,
                      style: Theme.of(context).textTheme.xTiniest),
                  const SizedBox(height: spacingXXSmall),
                  CustomTextField(onTextFieldChanged: (value) {}),
                  Row(
                    children: [
                      Text(StringConstants.kDoYouWantToDeactivateGST,
                          style: Theme.of(context).textTheme.xTiniest),
                      Switch(
                          activeColor: AppColor.saasifyLightDeepBlue,
                          value: true,
                          onChanged: (value) {
                            // Map productDetails = productList[index].toJson();
                            // productDetails['variant_active'] = value;
                            // context.read<ProductBloc>().add(
                            //     EditProduct(productDetailsMap: productDetails));
                          })
                    ],
                  ),
                  const SizedBox(
                    height: spacingXMedium,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SecondaryButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            buttonTitle: StringConstants.kCancel),
                      ),
                      const SizedBox(
                        width: spacingXXSmall,
                      ),
                      Expanded(
                        child: PrimaryButton(
                            onPressed: () {},
                            buttonTitle: StringConstants.kAdd),
                      )
                    ],
                  )
                ])));
  }
}
