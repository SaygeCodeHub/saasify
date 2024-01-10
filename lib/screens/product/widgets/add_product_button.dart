import 'package:flutter/material.dart';
import '../../../configs/app_dimensions.dart';
import '../../../data/models/screen_arguments/add_product_screen_arguments.dart';
import '../../../utils/constants/string_constants.dart';
import '../../../widgets/alert_dialogue_box.dart';
import '../../../widgets/primary_button.dart';
import '../add_product_screen.dart';

class AddProductButton extends StatelessWidget {
  const AddProductButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
        buttonWidth: kGeneralActionButtonWidth,
        onPressed: () {
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
        },
        buttonTitle: StringConstants.kAddProduct);
  }
}
