import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/customer_cache/customer_cache.dart';
import '../../data/models/branches/delete_branches_model.dart';
import '../../data/models/branches/edit_branches_model.dart';
import '../../data/models/branches/fetch_all_branches_model.dart';
import '../../data/models/branches/save_branch_model.dart';
import '../../di/app_module.dart';
import '../../repositories/branches/branches_repository.dart';
import 'branches_event.dart';
import 'branches_states.dart';

class BranchesBloc extends Bloc<BranchesEvents, BranchesStates> {
  final CustomerCache _customerCache = getIt<CustomerCache>();
  final BranchesRepository _branchesRepository = getIt<BranchesRepository>();

  BranchesStates get initialState => BranchesInitial();

  BranchesBloc() : super(BranchesInitial()) {
    on<EditBranches>(_editBranches);
    on<DeleteBranches>(_deleteBranches);
    on<SaveBranch>(_saveBranches);
    on<FetchAllBranches>(_fetchAllBranches);
  }

  FutureOr<void> _editBranches(
      EditBranches event, Emitter<BranchesStates> emit) async {
    emit(EditingBranches());
    try {
      String userId = await _customerCache.getUserId();
      String companyId = await _customerCache.getCompanyId();
      int branchId = await _customerCache.getBranchId();

      EditBranchesModel editBranchesModel = await _branchesRepository
          .editBranches(userId, companyId, branchId, {});

      if (editBranchesModel.status == 200) {
        emit(EditedBranches(message: editBranchesModel.message));
      } else {
        emit(ErrorEditingBranches(message: editBranchesModel.message));
      }
    } catch (e) {
      emit(ErrorEditingBranches(message: e.toString()));
    }
  }

  FutureOr<void> _deleteBranches(
      DeleteBranches event, Emitter<BranchesStates> emit) async {
    emit(DeletingBranches());
    try {
      String userId = await _customerCache.getUserId();
      String companyId = await _customerCache.getCompanyId();
      int branchId = await _customerCache.getBranchId();

      Map idsMap = {"category_ids": 1};

      DeleteBranchesModel deleteBranchesModel = await _branchesRepository
          .deleteBranches(userId, companyId, branchId, idsMap);

      if (deleteBranchesModel.status == 200) {
        emit(DeletedBranches(message: deleteBranchesModel.message));
      } else {
        emit(ErrorDeletingBranches(message: deleteBranchesModel.message));
      }
    } catch (e) {
      e.toString();
    }
  }

  FutureOr<void> _saveBranches(
      SaveBranch event, Emitter<BranchesStates> emit) async {
    emit(SavingBranch());
    try {
      String userId = await _customerCache.getUserId();
      String companyId = await _customerCache.getCompanyId();
      int branchId = await _customerCache.getBranchId();

      SaveBranchesModel saveBranchesModel = await _branchesRepository
          .saveBranches(userId, companyId, branchId, {});

      if (saveBranchesModel.status == 200) {
        emit(SavedBranch(message: saveBranchesModel.message));
      } else {
        emit(ErrorSavingBranch(message: saveBranchesModel.message));
      }
    } catch (e) {
      emit(ErrorSavingBranch(message: e.toString()));
    }
  }

  FutureOr<void> _fetchAllBranches(
      FetchAllBranches event, Emitter<BranchesStates> emit) async {
    emit(FetchingBranches());
    try {
      String userId = await _customerCache.getUserId();
      String companyId = await _customerCache.getCompanyId();

      FetchAllBranchesModel fetchAllBranchesModel =
          await _branchesRepository.fetchAllBranches(userId, companyId);
      if (fetchAllBranchesModel.status == 200) {
        emit(FetchedBranches(branchList: fetchAllBranchesModel.data));
      } else {
        emit(ErrorFetchingBranches(message: fetchAllBranchesModel.message));
      }
    } catch (e) {
      emit(ErrorFetchingBranches(message: e.toString()));
    }
  }
}
