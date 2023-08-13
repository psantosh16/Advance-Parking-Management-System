import 'package:apms_project/GlobalState/drawer_controller.dart';
import 'package:apms_project/Pages/Screens/Map/map_page.dart';
import 'package:apms_project/Pages/Screens/recipet_page.dart';
import 'package:apms_project/Pages/Screens/screen_page.dart';
import 'package:get/get.dart';
import 'Pages/Screens/Home/home_page.dart';
import 'Pages/auth/login_page.dart';
import 'Pages/auth/register_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});


  @override
  final DrawerControllers drawerController = Get.put(DrawerControllers());


  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      // home: const LoginPage(),
      initialRoute: "/register",
      routes: {
        "/register" : (context) => const RegisterPage(),
        "/login": (context) => const LoginPage(),
        "/home":(context) => const HomePage(),
        "/receipt":(context)=> const ReceiptPage(),
        "/map":(context)=> const MapPage(),
        "/screen":(context)=> const ScreenPage(),
      },
    );
  }
}
