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
    Category("profile", "person.png"),
    Category("wallet", "wallet.png"),
    Category("booked", "car.png"),
  ];

  @override
  Widget build(BuildContext context) {
    DrawerControllers controller = Get.put(DrawerControllers());

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Stack(
        fit: StackFit.expand,
        children: [
          const SizedBox(height: 4),
          // Upper
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SizedBox(
              // height: constraints.maxHeight / 6,
              width: ResponsiveUtils.screenWidth(context),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Drawer
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            controller.openDrawer();
                          },
                          child: const Icon(
                            Icons.menu_rounded,
                            color: Colors.white,
                            size: 40,
                          )),
                      const Text(
                        "Hi, John!",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 30,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  // Welcome Text
                  const Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Text(
                      "Welcome to Parkiza!",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  )
                ],
              ),
            ),
          ),

          const SizedBox(height: 10),
          // Bottom
          Container(
            decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
            child: DraggableScrollableSheet(
                minChildSize: 0.6,
                initialChildSize: 0.6,
                builder: (BuildContext context,
                    ScrollController scrollController) {
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
                                  height: ResponsiveUtils.screenHeight(
                                          context) *
                                      0.016),
                              // Horizontal ListView with icons
                              SizedBox(
                                height: ResponsiveUtils.screenHeight(
                                        context) *
                                    0.154,
                                child: GridView.builder(
                                  primary: false,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                  ),
                                  itemCount:
                                      3, // Total number of items in the grid
                                  itemBuilder: (context, idx) {
                                    return Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pushNamed(context,
                                                "/${_category[idx].title}");
                                          },
                                          child: Container(
                                            width: ResponsiveUtils
                                                    .screenWidth(
                                                        context) *
                                                0.28,
                                            height: ResponsiveUtils
                                                    .screenHeight(
                                                        context) *
                                                0.11,
                                            padding:
                                                const EdgeInsets.all(16),
                                            child: Image.asset(
                                                "assets/images/${_category[idx].link}"),
                                          ),
                                        ),
                                        Text(
                                          _category[idx].title,
                                          style: const TextStyle(
                                              fontWeight:
                                                  FontWeight.bold),
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
                }),
          ),
        ],
      )),
    );
  }
}
