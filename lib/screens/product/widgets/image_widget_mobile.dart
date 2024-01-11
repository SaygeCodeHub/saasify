import 'package:flutter/cupertino.dart';

import '../../../data/models/products/product_list_model.dart';

class ImageWidgetMobile extends StatelessWidget {
  final ProductWithVariant productList;

  const ImageWidgetMobile({super.key, required this.productList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.178,
        width: MediaQuery.sizeOf(context).width * 0.2,
        child: Image.network(productList.images[0].toString(),
            fit: BoxFit.fitHeight));
  }
}
