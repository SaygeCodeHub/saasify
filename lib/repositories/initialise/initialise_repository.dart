import 'package:saasify/data/models/initialise/initialise_app_model.dart';

abstract class InitialiseRepository {
  Future<InitialiseAppModel> initialiseApp();
}
