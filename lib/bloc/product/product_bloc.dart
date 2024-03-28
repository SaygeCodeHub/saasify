import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/product/product_event.dart';
import 'package:saasify/bloc/product/product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductState get initialState => ProductInitial();

  ProductBloc() : super(ProductInitial()) {
    on<AddProduct>(_addProduct);
  }

  FutureOr<void> _addProduct(
      AddProduct event, Emitter<ProductState> emit) async {
    try {
      emit(AddingProduct());
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw Exception("User not authenticated");
      }

      String userId = user.uid;
      String? categoryId = '';
      for (var item in event.categories) {
        categoryId = item.categoryId;
      }
      Map<String, dynamic> productData = event.product.toMap();
      final usersRef =
          FirebaseFirestore.instance.collection('users').doc(userId);
      CollectionReference companiesRef = usersRef.collection('companies');
      QuerySnapshot snapshot = await companiesRef.get();
      String companyId = '';
      for (var doc in snapshot.docs) {
        companyId = doc.id;
      }
      usersRef
          .collection('companies')
          .doc(companyId)
          .collection('modules')
          .doc('pos')
          .collection('categories')
          .doc(categoryId)
          .collection('products')
          .add({...productData, 'dateAdded': FieldValue.serverTimestamp()});
      emit(ProductAdded(successMessage: 'Product added successfully'));
    } catch (error) {
      emit(ProductNotAdded(errorMessage: 'Error adding product: $error'));
    }
  }
}
