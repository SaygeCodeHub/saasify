import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:saasify/utils/global.dart';
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ImagePickerWidget(
              label: 'Category Display Image',
              initialImage: _imageBytes,
              onImagePicked: _handleImagePicked,
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
            if (offlineModule) {
              final category = ProductCategories(
                  name: textEditingController.text, imageBytes: _imageBytes);
              final categoriesBox = Hive.box<ProductCategories>('categories');
              await categoriesBox.add(category).whenComplete(() {
                Navigator.pop(context);
              });
            } else {
              print('else---->');
              await addCategory();
            }
          },
        ),
      ],
    );
  }

  Future<void> addCategory() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw Exception("User not authenticated");
      }

      String userId = user.uid;
      ProductCategories category = ProductCategories(
          name: textEditingController.text, imageBytes: _imageBytes);

      // Convert ProductCategories instance to Map
      Map<String, dynamic> categoryData = category.toMap();

      final usersRef =
          FirebaseFirestore.instance.collection('users').doc(userId);
      usersRef
          .collection('module')
          .doc('pos')
          .collection('add category')
          .add(categoryData);

      print('Category added successfully');

      // Display success message or perform any other action
    } catch (e) {
      // Handle errors
      print('Error adding category: $e');
    }
  }
}
