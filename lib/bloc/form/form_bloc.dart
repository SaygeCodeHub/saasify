import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/data/models/form/form_structure_model.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/repositories/form/form_repository.dart';

import 'form_events.dart';
import 'form_states.dart';

class FormBloc extends Bloc<FormEvents, FormStates> {
  final FormRepository formRepository = getIt<FormRepository>();

  FormBloc() : super(FormInitialization()) {
    on<BuildForm>(_buildForm);
  }

  void _buildForm(BuildForm event, Emitter<FormStates> emit) async {
    emit(FormStructureFetching());
    try {
      FormStructureModel formStructureModel =
          await formRepository.fetchFormStructure();
      if (formStructureModel.status == 200) {
        emit(FormAssembled(formStructureModel: formStructureModel));
      } else {
        emit(FormBuildFailure());
      }
    } catch (e) {
      emit(FormBuildFailure());
    }
  }
}
