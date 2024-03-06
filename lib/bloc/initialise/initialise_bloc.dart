import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/initialise/initialise_events.dart';
import 'package:saasify/bloc/initialise/initialise_states.dart';
import 'package:saasify/caches/cache.dart';
import 'package:saasify/data/models/initialise/initialise_app_model.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/repositories/initialise/initialise_repository.dart';
import 'package:saasify/utils/notifications.dart';

class InitialiseAppBloc extends Bloc<InitialiseEvents, InitialiseAppStates> {
  final Cache cache = getIt<Cache>();
  final InitialiseRepository _initialiseRepository =
      getIt<InitialiseRepository>();
  List<ListOfBranches?>? branches = [];
  List<FeatureDetailModel> hrmsAccessibleFeatures = [];
  InitialiseAppModel? initialiseAppModel;

  InitialiseAppStates get initialState => InitialiseStates();

  InitialiseAppBloc() : super(InitialiseStates()) {
    on<InitialiseApp>(_initialiseApp);
  }

  FutureOr<void> _initialiseApp(
      InitialiseApp event, Emitter<InitialiseAppStates> emit) async {
    emit(InitialisingApp());
    // try {
    if (!kIsWeb) {
      bool tokenAvailable = await NotificationUtil().ifTokenExists();
      if (!tokenAvailable) {
        String newToken = await NotificationUtil().getToken();
        cache.setFCMToken(newToken);
      }
    }
    initialiseAppModel = await _initialiseRepository.initialiseApp();
    if (initialiseAppModel!.status == 200) {
      bool geoFencing = initialiseAppModel!.data!.geoFencing ?? false;
      branches = initialiseAppModel!.data!.branches;
      cache.setAccessibleModules(initialiseAppModel!.data!.accessibleModules!);
      cache.setAvailableModules(initialiseAppModel!.data!.availableModules!);
      cache.setUserName(initialiseAppModel!.data!.name);

      emit(AppInitialised(
          isGeoFencing: geoFencing, initialiseAppModel: initialiseAppModel!));
    } else {
      emit(InitialisingAppFailed(
          errorMessage: initialiseAppModel!.message.toString()));
    }
    // } catch (e) {
    //   emit(InitialisingAppFailed(errorMessage: e.toString()));
    // }
  }
}
