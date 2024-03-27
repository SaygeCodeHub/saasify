import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saasify/bloc/category/category_event.dart';
import 'package:saasify/bloc/category/category_state.dart';
import 'package:saasify/models/category/product_categories.dart';
import 'package:saasify/utils/global.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryState get initialState => CategoryInitial();

  CategoryBloc() : super(CategoryInitial()) {
    on<AddCategory>(_addCategory);
    on<FetchCategories>(_fetchCategories);
    on<PickCategoryImage>(_pickImage);
  }

  String selectedCategory = '';

  FutureOr<void> _addCategory(
      AddCategory event, Emitter<CategoryState> emit) async {
    emit(AddingCategory());
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw Exception("User not authenticated");
      }
      String userId = user.uid;
      ProductCategories category = ProductCategories(
          name: event.addCategoryMap['category_name'],
          imageBytes: event.addCategoryMap['image']);
      Map<String, dynamic> categoryData = category.toMap();
      final usersRef =
          FirebaseFirestore.instance.collection('users').doc(userId);
      usersRef
          .collection('module')
          .doc('pos')
          .collection('category')
          .add(categoryData);
      emit(CategoryAdded(successMessage: 'Category added successfully'));
    } catch (e) {
      emit(CategoryNotAdded(errorMessage: 'Error adding category: $e'));
    }
  }

  FutureOr<void> _fetchCategories(
      FetchCategories event, Emitter<CategoryState> emit) async {
    List<ProductCategories> categories = [];
    try {
      emit(FetchingCategories());
      if (offlineModule) {
        categories = Hive.box<ProductCategories>('categories').values.toList();
        if (categories.isNotEmpty) {
          selectedCategory = categories.first.name;
        }
        emit(CategoriesFetched(categories: categories));
      } else {
        User? user = FirebaseAuth.instance.currentUser;
        if (user == null) {
          throw Exception("User not authenticated");
        }
        String userId = user.uid;
        final usersRef =
            FirebaseFirestore.instance.collection('users').doc(userId);
        QuerySnapshot querySnapshot = await usersRef
            .collection('module')
            .doc('pos')
            .collection('categories')
            .get();
        for (var doc in querySnapshot.docs) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          ProductCategories category = ProductCategories(
              name: data['name'],
              imageBytes: data['imageBytes'],
              categoryId: doc.id);
          categories.add(category);
        }
        if (categories.isNotEmpty) {
          selectedCategory = categories.last.categoryId ?? '';
        }
        emit(CategoriesFetched(categories: categories));
      }
    } catch (e) {
      emit(CategoriesNotFetched(errorMessage: 'Error fetching categories: $e'));
    }
  }

  FutureOr<void> _pickImage(
      PickCategoryImage event, Emitter<CategoryState> emit) async {
    final ImagePicker picker = ImagePicker();
    Uint8List? imageBytes;
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    if (image != null) {
      imageBytes = File(image.path).readAsBytesSync();
    }
    emit(CategoriesFetched(
        categories: event.categories, imageBytes: imageBytes));
  }
}
