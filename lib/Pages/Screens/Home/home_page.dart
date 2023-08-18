import 'package:apms_project/GlobalState/drawer_controller.dart';
import 'package:apms_project/Utils/responsive_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  final List<Category> _category = [
    Category("Profile", "person.png"),
    Category("Wallet", "ewallet.png"),
    Category("Book", "bill.png"),
  ];

  @override
  Widget build(BuildContext context) {
    DrawerControllers controller = Get.put(DrawerControllers());

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Username
            Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Menu Button
                  Container(
                    height: ResponsiveUtils.screenHeight(context) * 0.045,
                    width: ResponsiveUtils.screenWidth(context) * 0.1,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        controller.openDrawer();
                      },
                      child: Icon(
                        Icons.menu,
                        size: ResponsiveUtils.textScaleFactor(context) * 32,
                      ),
                    ),
                  ),

                  // Username
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Hi, John!',
                        style: TextStyle(
                            fontSize:
                                ResponsiveUtils.textScaleFactor(context) * 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        '23 Jan, 2023',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize:
                                ResponsiveUtils.textScaleFactor(context) * 12,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: ResponsiveUtils.screenHeight(context) * 0.040),

            Text(
              "Welcome to PARKIZA",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: ResponsiveUtils.textScaleFactor(context) * 28,
                  fontWeight: FontWeight.w700),
            ),
            // Bottom
            SizedBox(height: ResponsiveUtils.screenHeight(context) * 0.05),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Category
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(_category.length, (index) {
                          return Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Container(
                                    width:
                                        ResponsiveUtils.screenWidth(context) *
                                            0.24,
                                    height:
                                        ResponsiveUtils.screenHeight(context) *
                                            0.12,
                                    padding: const EdgeInsets.all(16),
                                    child: Image.asset(
                                        "assets/images/${_category[index].link}"),
                                  ),
                                  Text(
                                    _category[index].title,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),

                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Text(
                          "Nearby Places,",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                      // Nearby places
                      Expanded(
                        child: ListView.builder(
                          itemCount: 10,
                          itemExtent: 100,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(top: 6),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                children: [
                                  Container(
                                    width:
                                        ResponsiveUtils.screenWidth(context) *
                                            0.4,
                                    padding: const EdgeInsets.all(4),
                                    child: Image.asset(
                                      "assets/images/landing_page2.jpg",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 14),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Name of place",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: ResponsiveUtils
                                                      .textScaleFactor(
                                                          context) *
                                                  17),
                                        ),
                                        const Row(
                                          children: [
                                            Icon(size: 16, Icons.location_on),
                                            Text(
                                              "Address of parking",
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          padding: const EdgeInsets.only(
                                              left: 4, top: 4),
                                          child: const Text(
                                            "Rs.15/hr",
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
