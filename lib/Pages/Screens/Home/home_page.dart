import 'package:apms_project/GlobalState/drawer_controller.dart';
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

  Category(this.title ,this.link);
}

class _HomePageState extends State<HomePage> {

  final List<Category> _category = [
      Category("Profile", "person.png"),
      Category("Wallet", "wallet.png"),
    Category("Booked", "car.png"),
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
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        controller.openDrawer();
                      },
                      child: const Icon(
                        Icons.menu,
                        size: 35,
                      ),
                    ),
                  ),

                  // Username
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Hi, John!',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        '23 Jan, 2023',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),

            const Text(
              "Welcome to PARKIZA",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w700),
            ),
            // Bottom
            const SizedBox(height: 50),
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
                        children: List.generate(_category.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Container(
                                    width: 100,
                                    height: 100,
                                    padding: const EdgeInsets.all(16),
                                    child: Image.asset("assets/images/${_category[index].link}"),
                                  ),
                                  Text(_category[index].title, style: const TextStyle(fontWeight: FontWeight.bold),),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),

                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Text("Nearby Places,", style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                      ),
                      // Nearby places
                      Expanded(
                        child: ListView.builder(
                          itemCount: 10,
                          itemExtent: 100,
                          itemBuilder: (context, index) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.center,

                              children: [
                                Container(
                                  width: 120 ,
                                  height: 100,
                                  padding: const EdgeInsets.all(4),
                                  child: Image.asset("assets/images/landing_page2.jpg",fit: BoxFit.cover,),
                                ),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Name of place",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                                    Row(
                                      children: [
                                        Icon(Icons.location_on),
                                        Text("Address of parking", style: TextStyle(color: Colors.grey),),
                                      ],
                                    ),
                                    Text("Rs.15/hr", style: TextStyle(fontWeight: FontWeight.bold),),
                                  ],
                                )

                              ],
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
