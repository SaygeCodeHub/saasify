import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:saasify/screens/authentication/auth/authentication_screen.dart';
import 'package:saasify/screens/companyDetails/register_company_screen.dart';
import 'package:saasify/screens/customers/add_customer_screen.dart';
import 'configs/app_theme.dart';
import 'dependency_injection.dart';
import 'firebase_options.dart';
import 'utils/global.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      home: AddCustomerScreen(),
    );
  }
}
