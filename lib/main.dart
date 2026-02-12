import 'package:flutter/material.dart';
import 'screens/login/login_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const BenePayApp());
}

class BenePayApp extends StatelessWidget {
  const BenePayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BenePay',
      theme: AppTheme.lightTheme,
      home: const LoginScreen(),
    );
  }
}
