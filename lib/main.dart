import 'package:flutter/material.dart';
import 'screens/login/login_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const PaymentsApp());
}

class PaymentsApp extends StatelessWidget {
  const PaymentsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Payments',
      theme: AppTheme.lightTheme,
      home: const LoginScreen(),
    );
  }
}
