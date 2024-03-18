import 'package:get_it/get_it.dart';
import 'package:saasify/repositories/attendance/attendance_repository.dart';
import 'package:saasify/repositories/attendance/attendance_repository_impl.dart';
import 'package:saasify/repositories/authentication/authentication_repository.dart';
import 'package:saasify/repositories/authentication/authentication_repository_impl.dart';
import 'package:saasify/repositories/buttonAction/button_action_repository.dart';
import 'package:saasify/repositories/buttonAction/button_action_repository_impl.dart';
import 'package:saasify/repositories/companies/companies_repository.dart';
import 'package:saasify/repositories/details/details_repository.dart';
import 'package:saasify/repositories/details/details_repository_impl.dart';
import 'package:saasify/repositories/form/form_repository.dart';
import 'package:saasify/repositories/form/form_repository_impl.dart';
import 'package:saasify/repositories/initialise/initialise_repository.dart';
import 'package:saasify/repositories/initialise/initialise_repository_impl.dart';
import 'package:saasify/repositories/register/register_repository.dart';
import 'package:saasify/repositories/register/register_repository_impl.dart';
import 'package:saasify/repositories/task/task_repository.dart';
import 'package:saasify/repositories/task/task_repository_impl.dart';
import 'package:saasify/repositories/viewData/view_data_repository.dart';
import 'package:saasify/repositories/viewData/view_data_repository_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../caches/cache.dart';
import '../repositories/companies/companies_repository_impl.dart';
import '../services/client_services.dart';

final getIt = GetIt.instance;

configurableDependencies() {
  getIt.registerLazySingleton<ClientServices>(() => ClientServices());

  getIt.registerLazySingletonAsync<SharedPreferences>(
      () async => await SharedPreferences.getInstance());
  getIt.registerLazySingleton<Cache>(
      () => Cache(sharedPreferences: getIt<SharedPreferences>()));
  getIt.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl());
  getIt.registerLazySingleton<RegisterRepository>(
      () => RegisterRepositoryImpl());
  getIt.registerLazySingleton<AttendanceRepository>(
      () => AttendanceRepositoryImpl());
  getIt.registerLazySingleton<CompaniesRepository>(
      () => CompaniesRepositoryImpl());
  getIt.registerLazySingleton<InitialiseRepository>(
      () => InitialiseRepositoryImpl());
  getIt.registerLazySingleton<FormRepository>(() => FormRepositoryImpl());
  getIt.registerLazySingleton<TaskRepository>(() => TaskRepositoryImpl());
  getIt.registerLazySingleton<ViewDataRepository>(
      () => ViewDataRepositoryImpl());
  getIt.registerLazySingleton<DetailsRepository>(() => DetailsRepositoryImpl());
  getIt.registerLazySingleton<ButtonActionRepository>(
      () => ButtonActionRepositoryImpl());
}
