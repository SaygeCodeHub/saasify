import 'package:flutter/material.dart';
import 'configs/app_theme.dart';
import 'dependency_injection.dart';
import 'screens/authentication/auth/authentication_screen.dart';
import 'utils/global.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    isMobile = MediaQuery.of(context).size.width < mobileBreakPoint;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'POS',
      theme: appTheme,
      home: AuthenticationScreen(),
    );
  }
}
