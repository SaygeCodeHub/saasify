import 'package:flutter/material.dart';
import 'package:saasify/screens/product/widgets/product_list_mobile_body.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/products/product_list_model.dart';
import '../../../data/models/screen_arguments/add_product_screen_arguments.dart';
import '../add_product_screen.dart';

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
                  child:
                      ProductListMobileBody(productList: productList[index]));
            },
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(height: spacingXXLarge),
            itemCount: productList.length));
  }
}
