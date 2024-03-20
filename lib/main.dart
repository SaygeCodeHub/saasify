import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/attendance/attendance_bloc.dart';
import 'package:saasify/bloc/auth/auth_events.dart';
import 'package:saasify/bloc/auth/auth_states.dart';
import 'package:saasify/bloc/buttonAction/button_action_bloc.dart';
import 'package:saasify/bloc/companies/companies_bloc.dart';
import 'package:saasify/bloc/details/details_bloc.dart';
import 'package:saasify/bloc/form/form_bloc.dart';
import 'package:saasify/bloc/initialise/initialise_bloc.dart';
import 'package:saasify/bloc/register/register_bloc.dart';
import 'package:saasify/bloc/resetPassword/reset_password_bloc.dart';
import 'package:saasify/bloc/task/task_bloc.dart';
import 'package:saasify/bloc/viewData/view_data_bloc.dart';
import 'package:saasify/configs/app_route.dart';
import 'package:saasify/screens/authentication/auth/auhentication_screen.dart';
import 'package:saasify/screens/companies/widgets/addCompany/add_company_screen.dart';
import 'package:saasify/screens/root_screen.dart';
import 'package:saasify/utils/notifications.dart';
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
  if (!kIsWeb) {
    await NotificationUtil().initNotifications();
  }
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
          BlocProvider(lazy: false, create: (context) => AttendanceBloc()),
          BlocProvider(create: (context) => RegisterBloc()),
          BlocProvider(create: (context) => CompaniesBloc()),
          BlocProvider(create: (context) => ResetPasswordBloc()),
          BlocProvider(create: (context) => InitialiseAppBloc()),
          BlocProvider(create: (context) => FormBloc()),
          BlocProvider(create: (context) => ButtonActionBloc()),
          BlocProvider(create: (context) => TaskBloc()),
          BlocProvider(create: (context) => ViewDataBloc()),
          BlocProvider(create: (context) => DetailsBloc()),
        ],
        child: GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: MaterialApp(
                debugShowCheckedModeBanner: false,
                navigatorObservers: [routeObserver],
                scrollBehavior:
                    const MaterialScrollBehavior().copyWith(scrollbars: false),
                onGenerateRoute: AppRoutes.routes,
                theme: appTheme,
                home: BlocBuilder<AuthBloc, AuthStates>(
                    builder: (context, state) {
                  if (state is ActiveSession) {
                    return const RootScreen();
                  } else if (state is NoCompanySelected) {
                    return AddCompanyScreen();
                  } else {
                    return AuthenticationScreen();
                  }
                }))));
  }
}
