import 'package:flutter/material.dart';
import 'screens/dashboard_screen.dart';
import 'screens/forgot_password.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';

void main() {   
  runApp(const PureWatersApp());
}

class PureWatersApp extends StatelessWidget {
  const PureWatersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pure Waters Organisation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/login', // Set initial route to Login screen
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/forgot_password': (context) => const ForgotPasswordScreen(),
        '/dashboard': (context) => const DashboardScreen(userName: null,userEmail: null,),
      },
    );
  }
}
