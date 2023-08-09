import 'package:apms_project/Pages/auth/login_page.dart';
import 'package:apms_project/Pages/auth/register_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      home: const LoginPage(),
      routes: {
        "/register" : (context) => const RegisterPage(),
        '/login': (context) => const LoginPage(),
      },
    );
  }
}
