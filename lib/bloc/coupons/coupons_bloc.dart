import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/customer_cache/customer_cache.dart';
import '../../data/models/coupons/delete_coupons_model.dart';
import '../../data/models/coupons/edit_coupons_model.dart';
import '../../data/models/coupons/fetch_all_coupons_model.dart';
import '../../data/models/coupons/save_coupons_model.dart';
import '../../di/app_module.dart';
import '../../repositories/coupons/coupons_repository.dart';
import 'coupons_event.dart';
import 'coupons_states.dart';

class CouponsBloc extends Bloc<CouponsEvents, CouponsStates> {
  final CustomerCache _customerCache = getIt<CustomerCache>();
  final CouponsRepository _couponsRepository = getIt<CouponsRepository>();

  CouponsStates get initialState => CouponsInitial();

  CouponsBloc() : super(CouponsInitial()) {
    on<EditCoupons>(_editCoupons);
    on<DeleteCoupons>(_deleteCoupons);
    on<SaveCoupons>(_saveCoupons);
    on<FetchAllCoupons>(_fetchAllCoupons);
  }

  FutureOr<void> _editCoupons(
      EditCoupons event, Emitter<CouponsStates> emit) async {
    emit(EditingCoupons());
    try {
      String userId = await _customerCache.getUserId();
      String companyId = await _customerCache.getCompanyId();
      int branchId = await _customerCache.getBranchId();

      EditCouponsModel editCouponsModel =
          await _couponsRepository.editCoupons(userId, companyId, branchId, {});

      if (editCouponsModel.status == 200) {
        emit(EditedCoupons(message: editCouponsModel.message));
      } else {
        emit(ErrorEditingCoupons(message: editCouponsModel.message));
      }
    } catch (e) {
      emit(ErrorEditingCoupons(message: e.toString()));
    }
  }

  FutureOr<void> _deleteCoupons(
      DeleteCoupons event, Emitter<CouponsStates> emit) async {
    emit(DeletingCoupons());
    try {
      String userId = await _customerCache.getUserId();
      String companyId = await _customerCache.getCompanyId();
      int branchId = await _customerCache.getBranchId();

      Map idsMap = {"category_ids": 1};

      DeleteCouponsModel deleteCouponsModel = await _couponsRepository
          .deleteCoupons(userId, companyId, branchId, idsMap);

      if (deleteCouponsModel.status == 200) {
        emit(DeletedCoupons(message: deleteCouponsModel.message));
      } else {
        emit(ErrorDeletingCoupons(message: deleteCouponsModel.message));
      }
    } catch (e) {
      e.toString();
    }
  }

  FutureOr<void> _saveCoupons(
      SaveCoupons event, Emitter<CouponsStates> emit) async {
    emit(SavingCoupons());
    try {
      String userId = await _customerCache.getUserId();
      String companyId = await _customerCache.getCompanyId();
      int branchId = await _customerCache.getBranchId();

      SaveCouponsModel saveCouponsModel =
          await _couponsRepository.saveCoupons(userId, companyId, branchId, {});

      if (saveCouponsModel.status == 200) {
        emit(SavedCoupons(message: saveCouponsModel.message));
      } else {
        emit(ErrorSavingCoupons(message: saveCouponsModel.message));
      }
    } catch (e) {
      emit(ErrorSavingCoupons(message: e.toString()));
    }
  }

  FutureOr<void> _fetchAllCoupons(
      FetchAllCoupons event, Emitter<CouponsStates> emit) async {
    emit(FetchingCoupons());
    try {
      String userId = await _customerCache.getUserId();
      String companyId = await _customerCache.getCompanyId();

      FetchAllCouponsModel fetchAllCouponsModel =
          await _couponsRepository.fetchAllCoupons(userId, companyId);
      if (fetchAllCouponsModel.status == 200) {
        emit(FetchedCoupons());
      } else {
        emit(ErrorFetchingCoupons(message: fetchAllCouponsModel.message));
      }
    } catch (e) {
      emit(ErrorFetchingCoupons(message: e.toString()));
    }
  }
}
