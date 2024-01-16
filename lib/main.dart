import 'package:firebase_core/firebase_core.dart';
import 'package:saasify/configs/app_route.dart';
import 'package:saasify/screens/authentication/auhentication_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'configs/new_app_theme.dart';
import 'di/app_module.dart';
import 'firebase_options.dart';

void main() async {
  await _initDependencies();
  await _initFirebase();
  runApp(const MyPosApp());
}

_initFirebase() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

_initDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configurableDependencies();
  await getIt.isReady<SharedPreferences>();
}

class MyPosApp extends StatelessWidget {
  const MyPosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            scrollBehavior:
                const MaterialScrollBehavior().copyWith(scrollbars: false),
            onGenerateRoute: AppRoutes.routes,
            theme: newAppTheme,
            home: AuthenticationScreen()));
  }
}
