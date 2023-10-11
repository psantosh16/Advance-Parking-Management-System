import 'package:apms_project/Controller/drawer_controller.dart';
import 'package:apms_project/Utils/responsive_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<Map<String, dynamic>> fetchData() async {
  DocumentSnapshot user = await FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .get();

  Map<String, dynamic> Data = user.data() as Map<String, dynamic>;
  return Data;
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class Category {
  final String title;
  final String link;

  Category(this.title, this.link);
}

class _HomePageState extends State<HomePage> {
  late Map<String, dynamic> data = {};

  @override
  void initState() {
    super.initState();
    fetchData().then((result) {
      setState(() {
        data = result; // Assign the fetched data to the 'data' list.
      });
    });
  }

  final List<Category> _category = [
    Category("profile", "person.png"),
    Category("wallet", "wallet.png"),
    Category("booked", "car.png"),
  ];

  String capitalize(String input) {
    if (input.isEmpty) return input;
    return input[0].toUpperCase() + input.substring(1);
  }

  String getGreeting() {
    final currentTime = DateTime.now();
    final currentHour = currentTime.hour;

    if (currentHour >= 0 && currentHour < 12) {
      return 'Good morning';
    } else if (currentHour >= 12 && currentHour < 18) {
      return 'Good afternoon';
    } else {
      return 'Good evening';
    }
  }

  @override
  Widget build(BuildContext context) {
    DrawerControllers controller = Get.put(DrawerControllers());

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Column(
              children: [
                Image.asset("assets/images/homeScreen.webp"),
              ],
            ),
          ),
          // Bottom
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: DraggableScrollableSheet(
              minChildSize: 0.625,
              initialChildSize: 0.628,
              maxChildSize: 0.9,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: ListView(
                    physics: const ClampingScrollPhysics(),
                    controller: scrollController,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            // Drag indicator
                            const SizedBox(
                              width: 60,
                              child: ClipOval(
                                child: Divider(
                                  thickness: 6,
                                ),
                              ),
                            ),
                            SizedBox(
                                height: ResponsiveUtils.screenHeight(context) *
                                    0.016),
                            // Horizontal ListView with icons
                            SizedBox(
                              height:
                                  ResponsiveUtils.screenHeight(context) * 0.154,
                              child: GridView.builder(
                                primary: false,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: _category.length,
                                ),
                                itemCount: _category
                                    .length, // Total number of items in the grid
                                itemBuilder: (context, idx) {
                                  return Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(context,
                                              "/${_category[idx].title}");
                                        },
                                        child: Container(
                                          width: ResponsiveUtils.screenWidth(
                                                  context) *
                                              0.28,
                                          height: ResponsiveUtils.screenHeight(
                                                  context) *
                                              0.11,
                                          padding: const EdgeInsets.all(16),
                                          child: Image.asset(
                                              "assets/images/${_category[idx].link}"),
                                        ),
                                      ),
                                      Text(
                                        capitalize(_category[idx].title),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Upper
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SizedBox(
              width: ResponsiveUtils.screenWidth(context),
              child: Column(
                children: [
                  // Drawer
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        child: const Icon(
                          Icons.menu_rounded,
                          color: Colors.white,
                          size: 40,
                        ),
                        onTap: () {
                          controller.openDrawer();
                        },
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Hi, ${data['name']}!",
                            style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 25,
                                color: Colors.white),
                          ),
                          Text(
                            getGreeting(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
