import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/POS/pos_event.dart';
import 'package:saasify/bloc/POS/pos_state.dart';
import 'package:saasify/data/models/POS/bill_model.dart';
import 'package:saasify/data/models/POS/cart_product_model.dart';
import 'package:saasify/data/models/POS/product_with_categories_model.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/repositories/POS/pos_repository.dart';

class POSBloc extends Bloc<POSEvents, POSStates> {
  final POSRepository posRepository = getIt<POSRepository>();

  Map<int, CartItemModel> cartProducts = {};
  BillModel billModel = BillModel(
    customerName: '',
    customerPhone: '',
    tax: 0,
    totalAmount: 0,
    discount: 0,
    itemTotal: 0,
    orderDate: DateTime.now().toIso8601String(),
    orderNumber: '${DateTime.now().millisecondsSinceEpoch}}',
  );
  int selectedCategory = 0;

  POSBloc() : super(PosInitial()) {
    on<FetchProductsWithCategories>(_fetchProductsWithCategories);
    on<RemoveCartItem>(_removeCartItem);
    on<CalculateBill>(_calculateBill);
    on<AddCartItem>(_addCartItem);
    on<ReloadPOS>(_reloadPOS);
  }

  FutureOr<void> _fetchProductsWithCategories(
      FetchProductsWithCategories event, Emitter<POSStates> emit) async {
    emit(ProductByCategoryLoading());
    try {
      final ProductsWithCategoriesModel productsWithCategoriesModel =
          await posRepository.getAllProductsWithCategories();
      if (productsWithCategoriesModel.status == 200) {
        selectedCategory = productsWithCategoriesModel.data.first.categoryId;
        emit(ProductByCategoryLoaded(
            cartItems: cartProducts.values.toList(),
            productsWithCategories: productsWithCategoriesModel.data,
            selectedCategory: selectedCategory));
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

  FutureOr<void> _calculateBill(
      CalculateBill event, Emitter<POSStates> emit) async {
    billModel.itemTotal = 0;
    cartProducts.forEach((key, value) {
      billModel.itemTotal += value.cost * value.count;
    });
    billModel.totalAmount = billModel.itemTotal +
        billModel.itemTotal * billModel.tax -
        billModel.itemTotal * billModel.discount;
    emit(ProductByCategoryLoaded(
        productsWithCategories: event.productsWithCategories,
        selectedCategory: selectedCategory,
        cartItems: cartProducts.values.toList()));
  }

  FutureOr<void> _removeCartItem(
      RemoveCartItem event, Emitter<POSStates> emit) async {
    if (cartProducts[event.variantId] != null) {
      if (cartProducts[event.variantId]!.count > 1) {
        cartProducts[event.variantId]!.count--;
      } else {
        cartProducts.remove(event.variantId);
      }
    }
    add(CalculateBill(productsWithCategories: event.productsWithCategories));
  }

  FutureOr<void> _addCartItem(
      AddCartItem event, Emitter<POSStates> emit) async {
    if (cartProducts[event.id] != null) {
      cartProducts[event.id]!.count++;
    } else {
      cartProducts[event.variant!.variantId] = CartItemModel(
          id: event.variant!.variantId,
          quantity: event.variant!.quantity,
          name: event.productName,
          cost: event.variant!.cost,
          image: event.variant!.image,
          count: 1);
    }
    add(CalculateBill(productsWithCategories: event.productsWithCategories));
  }

  FutureOr<void> _reloadPOS(ReloadPOS event, Emitter<POSStates> emit) async {
    emit(ProductByCategoryLoaded(
        productsWithCategories: event.productsWithCategories,
        selectedCategory: selectedCategory,
        cartItems: cartProducts.values.toList()));
  }
}
