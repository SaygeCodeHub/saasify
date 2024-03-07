abstract class FormEvents {}

class BuildForm extends FormEvents {
  final String endpoint;

  BuildForm({required this.endpoint});
}

class SubmitForm extends FormEvents {}

class PerformFormUtilityAction extends FormEvents {}
