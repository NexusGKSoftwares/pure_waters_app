import 'package:flutter/material.dart';
import 'screens/dashboard_screen.dart';
import 'screens/forgot_password.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart'; // Assuming you have this screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login', // Set initial route to login screen
      routes: {
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/forgot_password': (context) => const ForgotPasswordPage(),
        '/dashboard': (context) => const DashboardScreen(), // Replace with actual screen
      },
    );
  }
}
