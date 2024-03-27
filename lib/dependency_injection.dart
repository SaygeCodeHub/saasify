import 'package:get_it/get_it.dart';

import 'hive_setup.dart';

final getIt = GetIt.instance;

void setupDependencies() async {
  // final bool isOffline = await _checkOfflineMode();
  const bool isOffline = true;

  if (isOffline) {
    await setupHive();
  }
}
