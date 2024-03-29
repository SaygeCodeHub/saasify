import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/auth/auth_events.dart';
import 'package:saasify/bloc/auth/auth_states.dart';
import 'package:saasify/configs/app_route.dart';
import 'package:saasify/screens/authentication/auth/auhentication_screen.dart';
import 'package:saasify/screens/hrms/hrms_dashboard_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'bloc/auth/auth_bloc.dart';
import 'configs/app_theme.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            lazy: false,
            create: (context) => AuthBloc()..add(CheckActiveSession())),
      ],
      child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: MaterialApp(
              debugShowCheckedModeBanner: false,
              scrollBehavior:
                  const MaterialScrollBehavior().copyWith(scrollbars: false),
              onGenerateRoute: AppRoutes.routes,
              theme: appTheme,
              home:
                  BlocBuilder<AuthBloc, AuthStates>(builder: (context, state) {
                if (state is ActiveSession) {
                  return const HRMSDashboardScreen();
                } else {
                  return AuthenticationScreen();
                }
              }))),
    );
  }
}
