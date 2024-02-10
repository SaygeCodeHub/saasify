import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/POS/pos_event.dart';
import 'package:saasify/bloc/POS/pos_state.dart';
import 'package:saasify/data/models/POS/product_with_categories_model.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/repositories/POS/pos_repository.dart';

class POSBloc extends Bloc<POSEvents, POSStates> {
  final POSRepository posRepository = getIt<POSRepository>();
  POSBloc() : super(PosInitial()) {
    on<FetchProductsWithCategories>(_fetchProductsWithCategories);
    on<CategorySelected>(_categorySelected);
  }

  FutureOr<void> _categorySelected(
      CategorySelected event, Emitter<POSStates> emit) async {
    emit(ProductByCategoryLoaded(
        productsWithCategories: event.productsWithCategories,
        selectedCategory: event.selectedCategory));
  }

  FutureOr<void> _fetchProductsWithCategories(
      FetchProductsWithCategories event, Emitter<POSStates> emit) async {
    emit(ProductByCategoryLoading());
    try {
      final ProductsWithCategoriesModel productsWithCategoriesModel =
          await posRepository.getAllProductsWithCategories();
      if (productsWithCategoriesModel.status == 200) {
        emit(ProductByCategoryLoaded(
            productsWithCategories: productsWithCategoriesModel.data,
            selectedCategory:
                productsWithCategoriesModel.data.first.categoryId));
        return;
      } else {
        emit(ProductByCategoryError(
            errorMessage: productsWithCategoriesModel.message));
        return;
      }
    } catch (e) {
      emit(ProductByCategoryError(errorMessage: e.toString()));
    }
  }
}
