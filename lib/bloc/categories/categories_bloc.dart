import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/data/models/categories/delete_categories_model.dart';
import 'package:saasify/data/models/categories/edit_categories_model.dart';
import 'package:saasify/data/models/categories/fetch_all_categories_model.dart';
import '../../data/customer_cache/customer_cache.dart';
import '../../di/app_module.dart';
import '../../repositories/categories/categories_repository.dart';
import 'categories_event.dart';
import 'categories_states.dart';

class CategoriesBloc extends Bloc<CategoriesEvents, CategoriesStates> {
  final CustomerCache _customerCache = getIt<CustomerCache>();
  final CategoriesRepository _categoriesRepository =
      getIt<CategoriesRepository>();

  CategoriesStates get initialState => CategoriesInitial();

  CategoriesBloc() : super(CategoriesInitial()) {
    on<EditCategories>(_editCategory);
    on<DeleteCategories>(_deleteCategory);
    on<FetchAllCategories>(_fetchAllCategories);
  }

  FutureOr<void> _editCategory(
      EditCategories event, Emitter<CategoriesStates> emit) async {
    emit(EditingCategories());
    try {
      String userId = await _customerCache.getUserId();
      String companyId = await _customerCache.getCompanyId();
      int branchId = await _customerCache.getBranchId();

      EditCategoriesModel editCategoriesModel =
          await _categoriesRepository.editCategories(
              userId, companyId, branchId, event.categoryDetailsMap);

      if (editCategoriesModel.status == 200) {
        emit(EditedCategories(message: editCategoriesModel.message));
      } else {
        emit(ErrorEditingCategories(message: editCategoriesModel.message));
      }
    } catch (e) {
      emit(ErrorEditingCategories(message: e.toString()));
    }
  }

  FutureOr<void> _deleteCategory(
      DeleteCategories event, Emitter<CategoriesStates> emit) async {
    emit(DeletingCategories());
    try {
      String userId = await _customerCache.getUserId();
      String companyId = await _customerCache.getCompanyId();
      int branchId = await _customerCache.getBranchId();

      Map idsMap = {"category_ids": event.categoryId};

      DeleteCategoriesModel deleteCategoriesModel = await _categoriesRepository
          .deleteCategories(userId, companyId, branchId, idsMap);

      if (deleteCategoriesModel.status == 200) {
        emit(DeletedCategories(message: deleteCategoriesModel.message));
      } else {
        emit(ErrorDeletingCategories(message: deleteCategoriesModel.message));
      }
    } catch (e) {
      e.toString();
    }
  }

  FutureOr<void> _fetchAllCategories(
      FetchAllCategories event, Emitter<CategoriesStates> emit) async {
    emit(FetchingCategories());
    try {
      String userId = await _customerCache.getUserId();
      String companyId = await _customerCache.getCompanyId();
      int branchId = await _customerCache.getBranchId();

      FetchAllCategoriesModel fetchAllCategoriesModel =
          await _categoriesRepository.fetchAllCategories(
              userId, companyId, branchId);
      if (fetchAllCategoriesModel.status == 200) {
        emit(FetchedCategories(categoryList: fetchAllCategoriesModel.data));
      } else {
        emit(ErrorFetchingCategories(message: fetchAllCategoriesModel.message));
      }
    } catch (e) {
      emit(ErrorFetchingCategories(message: e.toString()));
    }
  }
}
