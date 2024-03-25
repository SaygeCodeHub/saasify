import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saasify/configs/app_theme.dart';

import '../../configs/app_colors.dart';
import '../../configs/app_spacing.dart';
import '../../models/category/product_categories.dart';
import '../../utils/image_handling.dart';
import '../widgets/buttons/primary_button.dart';
import '../skeleton_screen.dart';
import '../widgets/lable_and_textfield_widget.dart';

class AddCategoryScreen extends StatefulWidget {
  const AddCategoryScreen({super.key});

  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  final TextEditingController textEditingController = TextEditingController();
  Uint8List? _imageBytes;

  Future<void> _pickAndSetImage() async {
    final XFile? pickedImageFile = await ImageUtil.pickImage();
    if (pickedImageFile != null) {
      final Uint8List imageBytes = await pickedImageFile.readAsBytes();
      setState(() {
        _imageBytes = imageBytes;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SkeletonScreen(
      appBarTitle: 'Add Category',
      bodyContent: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Category Display Image',
                style: Theme.of(context).textTheme.fieldLabelTextStyle),
            const SizedBox(height: spacingSmall),
            InkWell(
              onTap: _pickAndSetImage,
              child: _imageBytes != null
                  ? Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.transparent),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Image.memory(_imageBytes!, fit: BoxFit.cover),
                    )
                  : Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: AppColors.lightGrey,
                        border:
                            Border.all(color: AppColors.darkBlue, width: 0.3),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child:
                          const Icon(Icons.upload, color: AppColors.darkGrey),
                    ),
            ),
            const SizedBox(height: spacingHuge),
            LabelAndTextFieldWidget(
              prefixIcon: const Icon(Icons.category),
              label: 'Category Name',
              isRequired: true,
              textFieldController: textEditingController,
            ),
          ],
        ),
      ),
      bottomBarButtons: [
        PrimaryButton(
          buttonTitle: 'Add Category',
          onPressed: () async {
            final category = ProductCategories(
              name: textEditingController.text,
              imageBytes: _imageBytes,
            );
            final categoriesBox = Hive.box<ProductCategories>('categories');
            await categoriesBox.add(category).whenComplete(() {
              Navigator.pop(context);
            });
          },
        ),
      ],
    );
  }
}
