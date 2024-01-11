import 'package:flutter/cupertino.dart';
import 'package:saasify/screens/product/widgets/publish_product_button.dart';
import 'package:saasify/screens/product/widgets/save_product_button.dart';
import '../../../configs/app_spacing.dart';

class PublishAndSaveButton extends StatelessWidget {
  final Map dataMap;
  final bool isEdit;
  final bool isProductDetail;
  final GlobalKey<FormState> _formKey;

  const PublishAndSaveButton(
      {super.key,
      required this.dataMap,
      required GlobalKey<FormState> formKey,
      required this.isEdit,
      required this.isProductDetail})
      : _formKey = formKey;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      Visibility(
          visible: dataMap['draft'] != false,
          child: SaveProductButton(
              dataMap: dataMap, formKey: _formKey, isEdit: isEdit)),
      const SizedBox(width: spacingLarge),
      (isProductDetail == true)
          ? const SizedBox()
          : PublishProductButton(
              dataMap: dataMap, isEdit: isEdit, formKey: _formKey)
    ]);
  }
}
