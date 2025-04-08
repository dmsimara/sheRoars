import 'package:flutter/material.dart';
import 'package:to_yudi/firebase_options.dart';
import 'package:to_yudi/src/utils/theme/theme.dart';
import 'package:to_yudi/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:to_yudi/src/features/authentication/screens/login/login_screen.dart';  // Add your login screen import
import 'package:to_yudi/src/features/authentication/screens/dashboards/admin_screen.dart';  // Add admin dashboard import
import 'package:to_yudi/src/features/authentication/screens/dashboards/user_screen.dart';  // Add admin dashboard import

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yudi',
      theme: TAppTheme.lightTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),  
        '/login': (context) => const LoginScreen(),   
        '/admin_dashboard': (context) => const AdminDashboardScreen(),   
        '/user_dashboard': (context) => const UserDashboardScreen(),   
      },
    );
  }
}
