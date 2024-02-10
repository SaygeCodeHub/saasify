import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/POS/pos_event.dart';
import 'package:saasify/bloc/POS/pos_state.dart';

class POSBloc extends Bloc<POSEvents, POSStates> {
  POSBloc() : super(PosInitial()) {
    on<FetchProductsWithCategories>(_fetchProductsWithCategories);
  }

  void _fetchProductsWithCategories(
      FetchProductsWithCategories event, Emitter<POSStates> emit) {

  }
}
