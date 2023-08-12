import 'package:apms_project/Pages/Screens/home_page.dart';
import 'package:apms_project/Pages/Screens/map_page.dart';
import 'package:apms_project/Pages/Screens/recipet_page.dart';
import 'package:apms_project/Theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'settings_page.dart';

class ScreenPage extends StatefulWidget {
  const ScreenPage({super.key});

  @override
  State<ScreenPage> createState() => _ScreenPageState();
}

class _ScreenPageState extends State<ScreenPage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomePage(),
    const MapPage(),
    const ReceiptPage(),
    const SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        currentIndex: _selectedIndex,
        selectedLabelStyle: const TextStyle(color: ColorTheme.blackTheme),
        selectedItemColor: ColorTheme.blueTheme,
        unselectedItemColor: ColorTheme.blackTheme,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.pin_drop), label: "Map"),
          BottomNavigationBarItem(
              icon: Icon(Icons.receipt), label: "Parking History"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
        ],
      ),
      body: _screens[_selectedIndex],
    );
  }

  getGreeting() {
    final hr = DateTime.now().hour;

    if (hr < 12) {
      return "Have a Good day";
    } else if (hr >= 12 || hr <= 17) {
      return "Good Afternoon";
    } else if (hr >= 18 || hr <= 21) {
      return "Good Evening";
    } else {
      return "Good Night";
    }
  }
}
