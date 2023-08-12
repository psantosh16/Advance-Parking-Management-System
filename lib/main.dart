import 'package:apms_project/Pages/Screens/map_page.dart';
import 'package:apms_project/Pages/Screens/recipet_page.dart';
import 'package:apms_project/Pages/Screens/screen_page.dart';

import 'Pages/Screens/home_page.dart';
import 'Pages/Screens/settings_page.dart';
import 'Pages/auth/login_page.dart';
import 'Pages/auth/register_page.dart';
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
      // home: const LoginPage(),
      initialRoute: "/home",
      routes: {
        "/register" : (context) => const RegisterPage(),
        "/login": (context) => const LoginPage(),
        "/home":(context) => const HomePage(),
        "/setting":(context)=> const SettingPage(),
        "/receipt":(context)=> const ReceiptPage(),
        "/map":(context)=> const MapPage(),
        "/screen":(context)=> const ScreenPage(),
      },
    );
  }
}
