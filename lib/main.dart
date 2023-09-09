import 'package:apms_project/GlobalState/ParkingController/parking_spot_controller.dart';
import 'package:apms_project/GlobalState/provider/slotbutton.dart';
import 'package:apms_project/Pages/Screens/Booking/bookingpage.dart';
import 'package:apms_project/Pages/Screens/MapPage/map_pages.dart';
import 'package:apms_project/Pages/Screens/Profile/profile_page.dart';
import 'package:apms_project/Pages/Screens/Recipt/recipet_page.dart';
import 'package:apms_project/Pages/Screens/screen_page_handler.dart';
import 'package:apms_project/Pages/Screens/Payment/wallet_page.dart';
import 'package:apms_project/Utils/color_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'Pages/Screens/Home/home_page.dart';
import 'Pages/auth/login_page.dart';
import 'Pages/auth/register_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
    print('-- main');

  WidgetsFlutterBinding.ensureInitialized();
    print('-- WidgetsFlutterBinding.ensureInitialized');

  await Firebase.initializeApp();
    print('-- main: Firebase.initializeApp');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialized GetMaterialApp
    var loginstatus = "";
    if (FirebaseAuth.instance.currentUser == null) {
      loginstatus = "login";
    } else {
      loginstatus = "screen";
    }

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> ParkingSpotProvider()),
        ChangeNotifierProvider(create: (_) => ButtonController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          appBarTheme: const AppBarTheme(
              color: ColorTheme.blackTheme, elevation: 0, toolbarHeight: 80),
        ),
        initialRoute: "/$loginstatus",
        routes: {
          // Auth
          "/register": (context) => const RegisterPage(),
          "/login": (context) => const LoginPage(),

          // Screen
          "/home": (context) => const HomePage(),
          "/receipt": (context) => const ReceiptPage(),
          "/map": (context) => const MapsPage(),
          "/booking": (context) => const BookingPage(),
          "/screen": (context) => const ScreenPage(),
          "/wallet": (context) => const WalletPage(),
          "/profile": (context) => const ProfilePage(),
        },
      ),
    );
  }
}
