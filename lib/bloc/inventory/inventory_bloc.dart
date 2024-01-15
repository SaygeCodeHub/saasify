import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/product/product_state.dart';
import 'package:saasify/data/customer_cache/customer_cache.dart';
import 'package:saasify/data/models/inventory/fetch_inventory_list_model.dart';
import 'package:saasify/data/models/inventory/update_stock_model.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/repositories/inventory/inventory_repository.dart';
import 'inventory_event.dart';
import 'inventory_states.dart';

class InventoryBloc extends Bloc<InventoryEvents, InventoryStates> {
  final CustomerCache _customerCache = getIt<CustomerCache>();
  final InventoryRepository _inventoryRepository = getIt<InventoryRepository>();

  ProductStates get initialState => ProductInitial();

  InventoryBloc() : super(InventoryInitial()) {
    on<FetchInventoryList>(_fetchInventoryList);
    on<SelectInventoryItem>(_selectInventoryItem);
    on<UpdateStock>(_updateStock);
  }

  FutureOr<void> _fetchInventoryList(
      FetchInventoryList event, Emitter<InventoryStates> emit) async {
    emit(FetchingInventoryList());
    try {
      String userId = await _customerCache.getUserId();
      String companyId = await _customerCache.getCompanyId();
      int branchId = await _customerCache.getBranchId();
      FetchInventoryProductsModel fetchInventoryProductsModel =
          await _inventoryRepository.fetchInventoryProductList(
              userId, companyId, branchId);
      if (fetchInventoryProductsModel.status == 200) {
        emit(FetchedInventoryList(
            productList: fetchInventoryProductsModel.data));
      } else {
        emit(ErrorFetchingInventoryList(
            message: fetchInventoryProductsModel.message));
      }
    } catch (e) {
      emit(ErrorFetchingInventoryList(message: e.toString()));
    }
  }

  FutureOr<void> _updateStock(
      UpdateStock event, Emitter<InventoryStates> emit) async {
    emit(UpdatingStock());
    try {
      String userId = await _customerCache.getUserId();
      String companyId = await _customerCache.getCompanyId();
      int branchId = await _customerCache.getBranchId();

      UpdateStockModel updateStockModel = await _inventoryRepository
          .updateStock(userId, companyId, branchId, event.updateStockMap);

      if (updateStockModel.status == 200) {
        emit(UpdatedStock(message: updateStockModel.message));
      } else {
        emit(ErrorUpdatingStock(message: updateStockModel.message));
      }
    } catch (e) {
      emit(ErrorUpdatingStock(message: e.toString()));
    }
  }

  _selectInventoryItem(
      SelectInventoryItem event, Emitter<InventoryStates> emit) {
    emit(FetchedInventoryList(productList: event.productList));
  }
}
