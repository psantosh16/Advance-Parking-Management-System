import 'package:apms_project/Pages/Screens/Booking/bookingpage.dart';
import 'package:apms_project/Pages/Screens/Map/map_page.dart';
import 'package:apms_project/Pages/Screens/Recipt/recipet_page.dart';
import 'package:apms_project/Pages/Screens/screen_page.dart';
import 'package:apms_project/Pages/Screens/Payment/wallet_page.dart';
import 'package:apms_project/Utils/color_theme.dart';
import 'package:get/get.dart';
import 'Pages/Screens/Home/home_page.dart';
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

    // Initialized GetMaterialApp
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
            color: ColorTheme.blackTheme, elevation: 0, toolbarHeight: 80),
      ),
      initialRoute: "/register",

      routes: {
        // Auth Routes
        "/register": (context) => const RegisterPage(),
        "/login": (context) => const LoginPage(),

        // Screen Routes
        "/home": (context) => const HomePage(),
        "/receipt": (context) => const ReceiptPage(),
        "/map": (context) => const MapPage(),
        "/booking" : (context) => const BookingPage(),
        "/screen": (context) => const ScreenPage(),
        "/wallet": (context) => const WalletPage(),
      },
    );
  }
}
