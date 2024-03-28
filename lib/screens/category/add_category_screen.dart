import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:saasify/bloc/category/category_bloc.dart';
import 'package:saasify/bloc/category/category_event.dart';
import 'package:saasify/bloc/category/category_state.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/utils/custom_dialogs.dart';
import 'package:saasify/utils/global.dart';
import 'package:saasify/utils/progress_bar.dart';
import '../../configs/app_spacing.dart';
import '../../models/category/product_categories.dart';
import '../widgets/buttons/primary_button.dart';
import '../skeleton_screen.dart';
import '../widgets/image_picker_widget.dart';
import '../widgets/lable_and_textfield_widget.dart';

class AddCategoryScreen extends StatefulWidget {
  const AddCategoryScreen({super.key});

  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  final TextEditingController textEditingController = TextEditingController();
  Uint8List? _imageBytes;
  final Map categoryMap = {};
  final formKey = GlobalKey<FormState>();

  void _handleImagePicked(Uint8List imageBytes) {
    setState(() {
      _imageBytes = imageBytes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SkeletonScreen(
      appBarTitle: 'Add Category',
      bodyContent: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ImagePickerWidget(
                    label: 'Category Display Image',
                    initialImage: _imageBytes,
                    onImagePicked: _handleImagePicked,
                  ),
                  const SizedBox(width: kDashContainerHeight),
                  Expanded(
                    child: LabelAndTextFieldWidget(
                      prefixIcon: const Icon(Icons.category),
                      label: 'Category Name',
                      isRequired: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required';
                        }
                        return null;
                      },
                      textFieldController: textEditingController,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: spacingHuge),
            ],
          ),
        ),
      ),
      bottomBarButtons: [
        BlocListener<CategoryBloc, CategoryState>(
          listener: (context, state) {
            if (state is AddingCategory) {
              ProgressBar.show(context);
            } else if (state is CategoryAdded) {
              ProgressBar.dismiss(context);
              showDialog(
                context: context,
                builder: (context) {
                  return CustomDialogs().showSuccessDialog(
                    context,
                    state.successMessage,
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                  );
                },
              );
            } else if (state is CategoryNotAdded) {
              ProgressBar.dismiss(context);
              showDialog(
                context: context,
                builder: (context) {
                  return CustomDialogs().showSuccessDialog(
                    context,
                    state.errorMessage,
                    onPressed: () => Navigator.pop(context),
                  );
                },
              );
            }
          },
          child: PrimaryButton(
            buttonTitle: 'Add Category',
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                if (kIsOfflineModule) {
                  final category = ProductCategories(
                    name: textEditingController.text,
                    imageBytes: _imageBytes,
                  );
                  final categoriesBox =
                      Hive.box<ProductCategories>('categories');
                  await categoriesBox.add(category).whenComplete(() {
                    Navigator.pop(context);
                  });
                } else {
                  categoryMap['category_name'] = textEditingController.text;
                  categoryMap['image'] = _imageBytes;
                  context
                      .read<CategoryBloc>()
                      .add(AddCategory(addCategoryMap: categoryMap));
                }
              }
            },
          ),
        ),
      ],
    );
  }
}
