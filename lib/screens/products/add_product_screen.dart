import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/category/category_bloc.dart';
import 'package:saasify/bloc/category/category_event.dart';
import 'package:saasify/bloc/category/category_state.dart';
import 'package:saasify/bloc/product/product_bloc.dart';
import 'package:saasify/bloc/product/product_state.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/screens/products/add_product_section.dart';
import 'package:saasify/utils/custom_dialogs.dart';
import '../../configs/app_spacing.dart';
import '../../models/category/product_categories.dart';
import '../skeleton_screen.dart';
import '../widgets/lable_and_textfield_widget.dart';
import 'add_product_button.dart';

class AddProductScreen extends StatelessWidget {
  AddProductScreen({super.key});

  static List<ProductCategories> categories = [];
  final formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();
  final TextEditingController _supplierController = TextEditingController();
  final TextEditingController _taxController = TextEditingController();
  final TextEditingController _minStockLevelController =
      TextEditingController();
  final TextEditingController _reorderPointController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    context.read<CategoryBloc>().add(FetchCategories());
    return SkeletonScreen(
        appBarTitle: 'Add Product',
        bodyContent: Form(
          key: formKey,
          child: BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              if (state is FetchingCategories) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is CategoriesFetched) {
                categories = state.categories;
                return _buildForm(context, state.imageBytes);
              } else if (state is CategoriesNotFetched) {
                return Center(child: Text(state.errorMessage));
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
        bottomBarButtons: [
          BlocListener<ProductBloc, ProductState>(
              listener: (context, state) {
                if (state is AddingProduct) {
                  const CircularProgressIndicator();
                } else if (state is ProductAdded) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return CustomDialogs().showSuccessDialog(
                            context, state.successMessage, onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        });
                      });
                } else if (state is ProductNotAdded) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return CustomDialogs().showSuccessDialog(
                            context, state.errorMessage,
                            onPressed: () => Navigator.pop(context));
                      });
                }
              },
              child: AddProductButton(
                  formKey: formKey,
                  categories: categories,
                  categoryMap: {
                    'name': _nameController.text,
                    'description': _descriptionController.text,
                    'supplier': _supplierController.text,
                    'tax': _taxController.text,
                    'min_stock': _minStockLevelController.text
                  }))
        ]);
  }

  Widget _buildForm(BuildContext context, Uint8List? imageBytes) {
    return LayoutBuilder(builder: (context, constraints) {
      final isTablet = constraints.maxWidth >= 600;
      final isMobile = constraints.maxWidth < 600;
      const isWeb = kIsWeb;
      int widgetsPerRow = isTablet
          ? 2
          : isMobile
              ? 1
              : isWeb
                  ? 3
                  : 1;
      List<Widget> formWidgets = [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Category',
                style: Theme.of(context).textTheme.fieldLabelTextStyle),
            const SizedBox(height: spacingSmall),
            DropdownButtonHideUnderline(
              child: DropdownButtonFormField<String>(
                value: context.read<CategoryBloc>().selectedCategory,
                hint: const Text("Select an item"),
                items: categories.map((category) {
                  return DropdownMenuItem<String>(
                    value: category.categoryId,
                    child: Text(category.name),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  context.read<CategoryBloc>().selectedCategory = newValue!;
                },
              ),
            ),
          ],
        ),
        LabelAndTextFieldWidget(
          prefixIcon: const Icon(Icons.drive_file_rename_outline),
          label: 'Name',
          isRequired: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is required';
            }
            return null;
          },
          textFieldController: _nameController,
        ),
        LabelAndTextFieldWidget(
          prefixIcon: const Icon(Icons.description),
          label: 'Description',
          textFieldController: _descriptionController,
        ),
        LabelAndTextFieldWidget(
          prefixIcon: const Icon(Icons.image),
          label: 'Image URL',
          textFieldController: _imageUrlController,
        ),
        LabelAndTextFieldWidget(
          prefixIcon: const Icon(Icons.supervisor_account),
          label: 'Supplier',
          isRequired: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is required';
            }
            return null;
          },
          textFieldController: _supplierController,
        ),
        LabelAndTextFieldWidget(
            prefixIcon: const Icon(Icons.attach_money),
            label: 'Tax',
            isRequired: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field is required';
              }
              return null;
            },
            keyboardType: TextInputType.number,
            textFieldController: _taxController),
        LabelAndTextFieldWidget(
          prefixIcon: const Icon(Icons.local_shipping),
          label: 'Minimum Stock Level',
          isRequired: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is required';
            }
            return null;
          },
          keyboardType: TextInputType.number,
          textFieldController: _minStockLevelController,
        ),
        LabelAndTextFieldWidget(
          prefixIcon: const Icon(Icons.reorder),
          label: 'Reorder Point',
          keyboardType: TextInputType.number,
          textFieldController: _reorderPointController,
        ),
      ];

      List<Widget> rows = [];
      for (int i = 0; i < formWidgets.length; i += widgetsPerRow) {
        List<Widget> rowChildren = [];
        for (int j = 0; j < widgetsPerRow && i + j < formWidgets.length; j++) {
          rowChildren.add(Expanded(child: formWidgets[i + j]));
          if (j < widgetsPerRow - 1) {
            rowChildren.add(const SizedBox(width: spacingStandard));
          }
        }
        rows.add(Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: rowChildren,
        ));
        rows.add(const SizedBox(height: spacingStandard));
      }

      return AddProductSection(
          imageBytes: imageBytes, rows: rows, categories: categories);
    });
  }
}
