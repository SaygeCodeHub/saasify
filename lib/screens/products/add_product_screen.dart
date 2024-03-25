import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saasify/configs/app_theme.dart';
import '../../configs/app_spacing.dart';
import '../../models/category/product_categories.dart';
import '../../models/product/products.dart';
import '../skeleton_screen.dart';
import '../widgets/buttons/primary_button.dart';
import '../widgets/lable_and_textfield_widget.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  AddProductScreenState createState() => AddProductScreenState();
}

class AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController _productController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();
  final TextEditingController _supplierController = TextEditingController();
  final TextEditingController _taxController = TextEditingController();
  final TextEditingController _minStockLevelController =
      TextEditingController();
  final TextEditingController _reorderPointController = TextEditingController();
  Uint8List? _imageBytes;
  String _selectedCategory = '';
  List<ProductCategories> _categories = [];
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _categories = Hive.box<ProductCategories>('categories').values.toList();
    if (_categories.isNotEmpty) {
      _selectedCategory = _categories.first.name;
    }
  }

  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    if (image != null) {
      setState(() {
        _imageBytes = File(image.path).readAsBytesSync();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isTablet = MediaQuery.of(context).size.shortestSide >= 600;
    final bool isMobile = MediaQuery.of(context).size.shortestSide < 600;
    const bool isWeb = kIsWeb;

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
              value: _selectedCategory,
              hint: const Text("Select an item"),
              items: _categories.map((category) {
                return DropdownMenuItem<String>(
                  value: category.name,
                  child: Text(category.name),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCategory = newValue!;
                });
              },
            ),
          ),
        ],
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
        textFieldController: _supplierController,
      ),
      LabelAndTextFieldWidget(
        prefixIcon: const Icon(Icons.attach_money),
        label: 'Tax',
        keyboardType: TextInputType.number,
        textFieldController: _taxController,
      ),
      LabelAndTextFieldWidget(
        prefixIcon: const Icon(Icons.local_shipping),
        label: 'Minimum Stock Level',
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
      rows.add(Row(children: rowChildren));
      rows.add(const SizedBox(height: spacingStandard));
    }

    return SkeletonScreen(
      appBarTitle: 'Add Product',
      bodyContent: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(spacingStandard),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: spacingStandard),
              Text(
                'Category Display Image',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: spacingStandard),
              _imageBytes != null
                  ? Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Image.memory(_imageBytes!, fit: BoxFit.cover),
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
                        onPressed: pickImage,
                        icon: const Icon(Icons.upload, color: Colors.grey),
                      ),
                    ),
              const SizedBox(height: spacingStandard),
              ...rows,
            ],
          ),
        ),
      ),
      bottomBarButtons: [
        PrimaryButton(
          buttonTitle: 'Add Product',
          onPressed: () async {
            final product = Products(
              productId: 0,
              name: _productController.text,
              category: _selectedCategory,
              description: _descriptionController.text,
              imageUrl: _imageUrlController.text,
              supplier: _supplierController.text,
              tax: double.tryParse(_taxController.text) ?? 0,
              minStockLevel: int.tryParse(_minStockLevelController.text) ?? 0,
              reorderPoint: int.tryParse(_reorderPointController.text) ?? 0,
              dateAdded: DateTime.now(),
              isActive: true,
              variants: [],
            );
            final productsBox = Hive.box<Products>('products');
            productsBox.add(product);
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
