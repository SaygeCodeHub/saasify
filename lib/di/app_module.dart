import 'package:get_it/get_it.dart';
import 'package:saasify/repositories/authentication/authentication_repository.dart';
import 'package:saasify/repositories/authentication/authentication_repository_impl.dart';
import 'package:saasify/repositories/billing/billing_repository.dart';
import 'package:saasify/repositories/billing/billing_repository_impl.dart';
import 'package:saasify/repositories/categories/categories_repository.dart';
import 'package:saasify/repositories/categories/categories_repository_impl.dart';
import 'package:saasify/repositories/inventory/inventory_repository.dart';
import 'package:saasify/repositories/inventory/inventory_repository_impl.dart';
import 'package:saasify/repositories/products/product_repository.dart';
import 'package:saasify/repositories/products/product_repository_impl.dart';
import 'package:saasify/repositories/profile/profile_repository.dart';
import 'package:saasify/repositories/upload/upload_repository.dart';
import 'package:saasify/repositories/upload/upload_repository_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/customer_cache/customer_cache.dart';
import '../repositories/branches/branches_repository.dart';
import '../repositories/branches/branches_repository_impl.dart';
import '../repositories/orders/orders_repository.dart';
import '../repositories/orders/orders_repository_impl.dart';
import '../repositories/profile/profile_repository_impl.dart';
import '../services/client_services.dart';

final getIt = GetIt.instance;

configurableDependencies() {
  getIt.registerLazySingleton<ClientServices>(() => ClientServices());

  getIt.registerLazySingletonAsync<SharedPreferences>(
      () async => await SharedPreferences.getInstance());
  getIt.registerLazySingleton<CustomerCache>(
      () => CustomerCache(sharedPreferences: getIt<SharedPreferences>()));
  getIt.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl());
  getIt.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl());
  getIt.registerLazySingleton<BranchesRepository>(
      () => BranchesRepositoryImpl());
  getIt.registerLazySingleton<InventoryRepository>(
      () => InventoryRepositoryImpl());
  getIt.registerLazySingleton<UploadRepository>(() => UploadRepositoryImpl());
  getIt.registerLazySingleton<BillingRepository>(() => BillingRepositoryImpl());
  getIt.registerLazySingleton<CategoriesRepository>(
      () => CategoriesRepositoryImpl());
  getIt.registerLazySingleton<OrdersRepository>(() => OrdersRepositoryImpl());
  getIt.registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImpl());
}
