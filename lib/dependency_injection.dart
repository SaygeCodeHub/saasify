import 'package:get_it/get_it.dart';

import 'hive_setup.dart';

final getIt = GetIt.instance;

void setupDependencies() async {
  // final bool isOffline = await _checkOfflineMode();
  const bool isOffline = true;

  if (isOffline) {
    await setupHive();
  } else {}
}

Future<bool> _checkOfflineMode() async {
  // Add your logic to determine offline or online mode
  // For example, you can check internet connectivity
  // Here, I'm simulating offline mode for demonstration purposes
  return true;
}
