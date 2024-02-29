import 'package:saasify/data/models/form/form_structure_model.dart';

abstract class FormStates {}

class FormInitialization extends FormStates {}

class FormStructureFetching extends FormStates {}

class FormAssembled extends FormStates {
  final FormStructureModel formStructureModel;

  FormAssembled({required this.formStructureModel});
}

class FormBuildFailure extends FormStates {}
