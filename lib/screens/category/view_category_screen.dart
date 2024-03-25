import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show ValueListenable;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:saasify/configs/app_theme.dart';

import '../../configs/app_colors.dart';
import '../../configs/app_spacing.dart';
import '../../models/category/product_categories.dart';
import '../skeleton_screen.dart';

class ViewCategoryScreen extends StatelessWidget {
  const ViewCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoriesBox = Hive.box<ProductCategories>('categories');
    final ValueListenable<Box<ProductCategories>> listenableBox =
        categoriesBox.listenable();
    return SkeletonScreen(
      appBarTitle: 'Categories',
      bodyContent: SingleChildScrollView(
        child: ValueListenableBuilder(
          valueListenable: listenableBox,
          builder: (context, Box<ProductCategories> box, _) {
            var width = MediaQuery.of(context).size.width;
            int crossAxisCount = width > 600 ? 5 : 2;

            return Padding(
              padding: const EdgeInsets.all(spacingStandard),
              child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 16.0,
                  ),
                  itemCount: box.length,
                  itemBuilder: (context, index) {
                    final category = box.getAt(index) as ProductCategories;
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColors.darkGrey, // Border color
                            width: 1.0 // Border width
                            ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: 100,
                              width: 100,
                              child: Image.memory(category.imageBytes!,
                                  fit: BoxFit.cover)),
                          const Divider(color: AppColors.darkGrey),
                          Text(category.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .gridViewLabelTextStyle),
                        ],
                      ),
                    );
                  }),
            );
          },
        ),
      ),
      bottomBarButtons: const [],
    );
  }
}
