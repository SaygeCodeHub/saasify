import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/details/details_event.dart';
import 'package:saasify/bloc/details/details_state.dart';
import 'package:saasify/data/models/details/fetch_details_model.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc() : super(DetailsInitial()) {
    on<FetchDetails>(_fetchDetails);
  }

  FutureOr<void> _fetchDetails(
      FetchDetails event, Emitter<DetailsState> emit) async {
    try {
      emit(FetchingDetails());
      FetchDetailsModel fetchDetailsModel = FetchDetailsModel(
          status: 200,
          message: '',
          data: Data(heading: 'Details', utilityButtons: [], sections: [
            Section(
                avatar: '',
                title: 'title 1',
                subtitle: 'subtitle 1',
                details: [
                  Detail(label: 'label 1 :', value: 'value 1'),
                  Detail(label: 'label 1 :', value: 'value 1'),
                  Detail(label: 'label 1 :', value: 'value 1'),
                  Detail(label: 'label 1 :', value: 'value 1'),
                  Detail(label: 'label 1 :', value: 'value 1')
                ]),
            Section(
                avatar: '',
                title: 'title 2',
                subtitle: 'subtitle 2',
                details: [
                  Detail(label: 'label 2 :', value: 'value 2'),
                  Detail(label: 'label 2 :', value: 'value 2'),
                  Detail(label: 'label 2 :', value: 'value 2')
                ]),
            Section(
                avatar: '',
                title: 'title 3',
                subtitle: 'subtitle 3',
                details: [
                  Detail(label: 'label 3 :', value: 'value 3'),
                  Detail(label: 'label 3 :', value: 'value 3'),
                  Detail(label: 'label 3 :', value: 'value 3'),
                  Detail(label: 'label 3 :', value: 'value 3'),
                  Detail(label: 'label 3 :', value: 'value 3'),
                  Detail(label: 'label 3 :', value: 'value 3'),
                  Detail(label: 'label 3 :', value: 'value 3'),
                  Detail(label: 'label 3 :', value: 'value 3')
                ]),
            Section(
                avatar: '',
                title: 'title 4',
                subtitle: 'subtitle 4',
                details: [
                  Detail(label: 'label 4 :', value: 'value 4'),
                  Detail(label: 'label 4 :', value: 'value 4')
                ]),
            Section(
                avatar: '',
                title: 'title 5',
                subtitle: 'subtitle 5',
                details: [
                  Detail(label: 'label 5 :', value: 'value 5'),
                  Detail(label: 'label 5 :', value: 'value 5'),
                  Detail(label: 'label 5 :', value: 'value 5'),
                  Detail(label: 'label 5 :', value: 'value 5'),
                  Detail(label: 'label 5 :', value: 'value 5'),
                  Detail(label: 'label 5 :', value: 'value 5'),
                  Detail(label: 'label 5 :', value: 'value 5'),
                  Detail(label: 'label 5 :', value: 'value 5')
                ]),
            Section(
                avatar: '',
                title: 'title 6',
                subtitle: '',
                details: [Detail(label: 'label 6 :', value: 'value 6')])
          ]));
      // await _detailsRepository.fetchDetails('');
      if (fetchDetailsModel.status == 200) {
        emit(DetailsFetched(fetchDetailsModel: fetchDetailsModel));
      } else {
        emit(DetailsCouldNotFetch(errorMessage: fetchDetailsModel.message));
      }
    } catch (e) {
      emit(DetailsCouldNotFetch(errorMessage: e.toString()));
    }
  }
}
