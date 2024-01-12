import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:saasify/bloc/authentication/authentication_bloc.dart';
import 'package:saasify/bloc/authentication/authentication_event.dart';
import 'package:saasify/bloc/upload/upload_bloc.dart';
import 'package:saasify/configs/app_route.dart';
import 'package:saasify/firebase_options.dart';
import 'package:saasify/screens/root_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'configs/new_app_theme.dart';
import 'di/app_module.dart';

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
              lazy: true,
              create: (context) =>
                  AuthenticationBloc()..add(CheckIfLoggedIn())),
          BlocProvider(lazy: true, create: (context) => UploadBloc())
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
                theme: newAppTheme,
                home: const RootScreen()
                // BlocListener<AuthenticationBloc, AuthenticationStates>(
                //     listener: (context, state) {
                //       if (state is IsLoggedIn) {
                //         Navigator.pushReplacementNamed(
                //             context, DashboardsScreen.routeName);
                //       }
                //     },
                //     child: AuthenticationScreen())
                )));
  }
}
