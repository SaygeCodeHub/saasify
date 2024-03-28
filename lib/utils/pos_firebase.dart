import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/category/product_categories.dart';

class PosFirebase {
  /*---------------Add Category-----------------*/
  Future<bool> addCategory(String categoryName, Uint8List? imageBytes) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw Exception("User not authenticated");
      }

      String userId = user.uid;
      ProductCategories category =
          ProductCategories(name: categoryName, imageBytes: imageBytes);

      Map<String, dynamic> categoryData = category.toMap();

      final usersRef =
          FirebaseFirestore.instance.collection('users').doc(userId);
      usersRef
          .collection('module')
          .doc('pos')
          .collection('add category')
          .add(categoryData);
      return true;
    } catch (e) {
      return false;
    }
  }
}
