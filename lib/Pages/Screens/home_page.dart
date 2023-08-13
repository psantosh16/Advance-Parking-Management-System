import 'package:apms_project/Theme/color_theme.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      backgroundColor: ColorTheme.blackTheme,
      body: SafeArea(
        child: Column(
          children: [
            // Upper Panel
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                        style: TextStyle(
                            color: ColorTheme.whiteTheme, fontSize: 12),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.notifications_active,
                    color: ColorTheme.whiteTheme,
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 40,
            ),
            // Lower Panel
            Expanded(
              child: Container(
                alignment: Alignment.topCenter,
                height: _queryData.size.height,
                width: _queryData.size.width,
                decoration: const BoxDecoration(
                  color: ColorTheme.whiteTheme,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 100,
                      child: ListView.builder(
                          itemCount: 8,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, ind){
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            alignment: Alignment.center,
                            width: 80,
                            height: 40,
                            decoration: const BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                            ),
                            child: Text("$ind"),
                          ),
                        );
                      })
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
