import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/category/category_bloc.dart';
import 'package:saasify/bloc/category/category_event.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/models/category/product_categories.dart';

class AddProductSection extends StatelessWidget {
  final Uint8List? imageBytes;
  final List rows;
  final List<ProductCategories> categories;
  const AddProductSection(
      {super.key,
      required this.imageBytes,
      required this.rows,
      required this.categories});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
            padding: const EdgeInsets.all(spacingStandard),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(height: spacingStandard),
              Text(
                'Category Display Image',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: spacingStandard),
              imageBytes != null
                  ? Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Image.memory(imageBytes!, fit: BoxFit.cover),
                    )
                  : Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        border: Border.all(color: Colors.blue, width: 0.3),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: IconButton(
                        onPressed: () {
                          context
                              .read<CategoryBloc>()
                              .add(PickCategoryImage(categories: categories));
                        },
                        icon: const Icon(Icons.upload, color: Colors.grey),
                      ),
                    ),
              const SizedBox(height: spacingStandard),
              ...rows,
            ])));
  }
}
