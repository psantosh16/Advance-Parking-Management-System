import 'package:apms_project/GlobalState/drawer_controller.dart';
import 'package:apms_project/Pages/Screens/Home/Booking/bookingpage.dart';
import 'package:apms_project/Pages/Screens/Home/home_page.dart';
import 'package:apms_project/Pages/Screens/Notification/notification_page.dart';
import 'package:apms_project/Pages/Screens/Recipt/recipet_page.dart';
import 'package:apms_project/Theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Home/drawer_widget.dart';

class ScreenPage extends StatefulWidget {
  const ScreenPage({super.key});

  @override
  State<ScreenPage> createState() => _ScreenPageState();
}

class _ScreenPageState extends State<ScreenPage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const BookingPage(),
    const HomePage(),
    // const ReceiptPage(),
    const NotificationPage(),
  ];

  @override
  Widget build(BuildContext context) {
    DrawerControllers controller = Get.put(DrawerControllers());

    return Scaffold(
      key: controller.scaffoldKey,
      drawer: const HomePageDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        currentIndex: _selectedIndex,
        backgroundColor: ColorTheme.blackTheme,
        selectedLabelStyle: const TextStyle(color: ColorTheme.whiteTheme),
        selectedItemColor: ColorTheme.whiteTheme,
        unselectedItemColor: ColorTheme.grayTheme,
        iconSize: 30,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.pin_drop), label: "Map"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),

          // BottomNavigationBarItem(
          //     icon: Icon(Icons.history), label: "Parking History"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_active), label: "Notification"),
        ],
      ),
      body: _screens[_selectedIndex],
    );
  }
}
