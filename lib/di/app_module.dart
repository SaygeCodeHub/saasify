import 'package:get_it/get_it.dart';
import 'package:saasify/repositories/POS/pos_repository.dart';
import 'package:saasify/repositories/POS/pos_repository_impl.dart';
import 'package:saasify/repositories/announcement/announcement_repository.dart';
import 'package:saasify/repositories/announcement/announcement_repository_impl.dart';
import 'package:saasify/repositories/attendance/attendance_repository.dart';
import 'package:saasify/repositories/attendance/attendance_repository_impl.dart';
import 'package:saasify/repositories/authentication/authentication_repository.dart';
import 'package:saasify/repositories/authentication/authentication_repository_impl.dart';
import 'package:saasify/repositories/companies/companies_repository.dart';
import 'package:saasify/repositories/employee/employee_reporistory_impl.dart';
import 'package:saasify/repositories/employee/employee_repository.dart';
import 'package:saasify/repositories/initialise/initialise_repository.dart';
import 'package:saasify/repositories/initialise/initialise_repository_impl.dart';
import 'package:saasify/repositories/register/register_repository.dart';
import 'package:saasify/repositories/register/register_repository_impl.dart';
import 'package:saasify/repositories/salary_rollouts/salary_rollout_repository.dart';
import 'package:saasify/repositories/salary_rollouts/salary_rollout_repository_impl.dart';
import 'package:saasify/repositories/settings/settings_repository.dart';
import 'package:saasify/repositories/settings/settings_repository_impl.dart';
import 'package:saasify/repositories/task/task_repository.dart';
import 'package:saasify/repositories/task/task_repository_impl.dart';
import 'package:saasify/repositories/timesheet/timesheet_repository.dart';
import 'package:saasify/repositories/timesheet/timesheet_repository_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../caches/cache.dart';
import '../repositories/companies/companies_repository_impl.dart';
import '../repositories/leaves/leaves_repository.dart';
import '../repositories/leaves/leaves_repository_impl.dart';
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
  getIt.registerLazySingleton<POSRepository>(() => POSRepositoryImpl());
  getIt.registerLazySingleton<EmployeeRepository>(
      () => EmployeeRepositoryImpl());
  getIt.registerLazySingleton<CompaniesRepository>(
      () => CompaniesRepositoryImpl());
  getIt.registerLazySingleton<LeavesRepository>(() => LeavesRepositoryImpl());
  getIt.registerLazySingleton<SalaryRolloutRepository>(
      () => SalaryRolloutRepositoryImpl());
  getIt.registerLazySingleton<SettingsRepository>(
      () => SettingsRepositoryImpl());
  getIt.registerLazySingleton<TimeSheetRepository>(
      () => TimeSheetRepositoryImpl());
  getIt.registerLazySingleton<TaskRepository>(() => TaskRepositoryImpl());
  getIt.registerLazySingleton<AnnouncementRepository>(
      () => AnnouncementRepositoryImpl());
  getIt.registerLazySingleton<InitialiseRepository>(
      () => InitialiseRepositoryImpl());
}
