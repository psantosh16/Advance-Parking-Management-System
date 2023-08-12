import 'package:apms_project/Theme/color_theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.blackTheme,
      body: SafeArea(
        child: Column(
          children: [
            // User Info Panel
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // User Greetings
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hi John!",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: ColorTheme.whiteTheme,
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "23 Jan ,2023",
                            style: TextStyle(
                              color: ColorTheme.whiteTheme,
                            ),
                          ),
                        ],
                      ),

                      // Notification
                      Stack(alignment: AlignmentDirectional.topEnd, children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: ColorTheme.whiteTheme,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.notifications_active,
                            color: ColorTheme.blackTheme,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                              color: ColorTheme.blueTheme,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Text(
                            "2",
                            style: TextStyle(
                              color: ColorTheme.whiteTheme,
                            ),
                          ),
                        ),
                      ])
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // Welcome Message
            const Text(
              "Welcome to Parking App",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                color: ColorTheme.whiteTheme,
              ),
            ),

            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    ),
                    color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
