import 'package:saasify/data/models/form/form_structure_model.dart';

abstract class FormRepository {
  /// Fetches the form structure from the server
  Future<FormStructureModel> fetchFormStructure();
}