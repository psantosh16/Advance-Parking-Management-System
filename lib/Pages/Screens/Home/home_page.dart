import 'package:apms_project/GlobalState/drawer_controller.dart';
import 'package:apms_project/Pages/Screens/Home/drawer_widget.dart';
import 'package:apms_project/Theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late MediaQueryData _queryData;

  final List<Widget> scrollItem = [
    const Icon(Icons.hourglass_empty),
    const Icon(Icons.accessible_outlined),
    const Icon(Icons.face),
    const Icon(Icons.settings_remote),
    const Icon(Icons.hourglass_empty),
    const Icon(Icons.accessible_outlined),
    const Icon(Icons.face),
    const Icon(Icons.settings_remote)
  ];

  @override
  Widget build(BuildContext context) {
    _queryData = MediaQuery.of(context);
    DrawerControllers controller = Get.put(DrawerControllers());

    return Scaffold(
      key: controller.scaffoldKey,
      backgroundColor: ColorTheme.blackTheme,
      drawer: const HomePageDrawer(),
      body: SafeArea(
        child: Column(
          children: [

            // Upper Panel
            _buildUpperPanel(controller),

            const SizedBox(height: 90),

            // Lower Panel
            Expanded(
              child: Container(
                height: _queryData.size.height,
                width: _queryData.size.width,
                decoration: const BoxDecoration(
                  color: ColorTheme.whiteTheme,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding _buildUpperPanel(DrawerControllers controller) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildDrawerController(controller),
          // User Greetings
          const Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Hi, John!",
                style: TextStyle(
                    color: ColorTheme.whiteTheme,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "23 Jun, 2023",
                style: TextStyle(color: ColorTheme.whiteTheme, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }

  GestureDetector _buildDrawerController(DrawerControllers controller) {
    return GestureDetector(
      onTap: () {
        controller.openDrawer();
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: const BoxDecoration(
          color: ColorTheme.blurTheme,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: const Icon(
          Icons.menu,
          color: ColorTheme.blackTheme,
        ),
      ),
    );
  }
}
