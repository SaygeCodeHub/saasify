import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/viewData/view_data_event.dart';
import 'package:saasify/bloc/viewData/view_data_state.dart';
import 'package:saasify/data/models/viewData/view_data_model.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/repositories/viewData/view_data_repository.dart';

class ViewDataBloc extends Bloc<ViewDataEvents, ViewDataStates> {
  final ViewDataRepository viewDataRepository = getIt<ViewDataRepository>();

  ViewDataBloc() : super(ViewDataInitial()) {
    on<FetchData>(_fetchData);
  }

  void _fetchData(FetchData event, Emitter<ViewDataStates> emit) async {
    emit(FetchingData());
    // try {
    ViewDataModel viewDataModel = await viewDataRepository
        .fetchData(event.endpoint, {"isMobile": event.isMobile});

    if (viewDataModel.status == 200) {
      emit(DataFetched(viewDataModel.data));
    } else {
      emit(ErrorFetchingData(viewDataModel.message));
    }
    // } catch (e) {
    //   emit(ErrorFetchingData(e.toString()));
    // }
  }
}
