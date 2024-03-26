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
                name: textEditingController.text,
                imageBytes: _imageBytes,
              );
              final categoriesBox = Hive.box<ProductCategories>('categories');
              await categoriesBox.add(category).whenComplete(() {
                Navigator.pop(context);
              });
            } else {
              String moduleId = await (createModule('pos'));
              await addCategory(
                  moduleId, textEditingController.text, _imageBytes);
            }
          },
        ),
      ],
    );
  }

// Function to create a module within a user
  Future<String> createModule(String moduleName) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw Exception("User not authenticated");
      }

      String userId = user.uid;

      // Create the module document
      DocumentReference moduleRef = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('modules')
          .add({
        'name': moduleName,
        'createdAt': FieldValue.serverTimestamp(),
      });

      print('Module created with ID: ${moduleRef.id}');
      return moduleRef.id; // Return the module ID
    } catch (error) {
      print('Error creating module: $error');
      // Handle error appropriately
      throw error;
    }
  }

// Function to add a POS category within a module
  Future<void> addCategory(
      String moduleId, String categoryName, Uint8List? imageBytes) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw Exception("User not authenticated");
      }

      String userId = user.uid;

      // Check if the module belongs to the user
      DocumentSnapshot moduleSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('modules')
          .doc(moduleId)
          .get();
      if (!moduleSnapshot.exists) {
        throw Exception("Module not found");
      }

      // Create the category document within the POS collection
      DocumentReference categoryRef = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('modules')
          .doc(moduleId)
          .collection('pos')
          .add({
        'name': categoryName,
        'imageBytes': imageBytes,
        'createdAt': FieldValue.serverTimestamp(),
      });

      print('Category added with ID: ${categoryRef.id}');
    } catch (error) {
      print('Error adding category: $error');
      // Handle error appropriately
    }
  }
}
