import 'package:flutter/material.dart';
import 'package:saasify/screens/product/widgets/product_list_data_table.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/products/product_list_model.dart';
import '../../../data/models/screen_arguments/add_product_screen_arguments.dart';
import '../../../utils/constants/string_constants.dart';
import '../../../widgets/alert_dialogue_box.dart';
import '../../../widgets/custom_page_header.dart';
import '../add_product_screen.dart';
import '../product_screen.dart';
import 'no_data_available_widget.dart';

class ProductScreenWeb extends StatelessWidget {
  final List<ProductWithVariant> productList;
  final bool visible;

  const ProductScreenWeb({
    super.key,
    required this.productList,
    required this.visible,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CustomPageHeader(
          titleText: StringConstants.kProducts,
          buttonVisible: true,
          buttonTitle: StringConstants.kAddProduct,
          utilityVisible: true,
          deleteIconVisible: ProductScreen.selectedIds.isNotEmpty,
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
          }),
      const SizedBox(height: spacingStandard),
      ProductListDataTable(productList: productList),
      Visibility(visible: visible, child: const NoDataAvailableWidget()),
      Visibility(visible: visible, child: const Spacer())
    ]);
  }
}
