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

class Item {
  final Image link;
  final String name;

  Item(this.link, this.name);
}

class _HomePageState extends State<HomePage> {
  late MediaQueryData _queryData;
  final List<Item> gridItem = [
    Item(
        // "https://static.vecteezy.com/system/resources/thumbnails/014/467/179/small/recruitment-id-card-illustration-3d-png.png",
      Image.asset("person.png",fit: BoxFit.cover,),
        "Profile"), //ID card
    Item(
        // "https://cdn3d.iconscout.com/3d/premium/thumb/wallet-4521221-3754834.png?f=webp",
        Image.asset("wallet.png",fit: BoxFit.cover,),
        "Wallet"), //Wallet
    Item(
        // "https://cdn3d.iconscout.com/3d/premium/thumb/car-parking-8703645-7008708.png?f=webp",
        Image.asset("car.png",fit: BoxFit.cover,),
        "Parking Slot") //Parking slot
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

            const Padding(
              padding: EdgeInsets.only(top: 24, bottom: 65),
              child: Text(
                "WELCOME TO PARKIZA",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: ColorTheme.whiteTheme,
                    fontSize: 28,
                    fontWeight: FontWeight.w800),
              ),
            ),

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
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: SizedBox(
                        width: _queryData.size.width,
                        height: 130,
                        child: Row(
                          children: [
                            Expanded(
                              child: _buildGridView(),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  GridView _buildGridView() {
    return GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
        scrollDirection: Axis.horizontal,
        itemCount: gridItem.length,
        itemBuilder: (context, ind) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Image
              GestureDetector(
                onTap: (){
                  print(gridItem[ind].name);
                },
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    color: ColorTheme.grayBlurTheme,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child:Image.asset("landing_page2.jpg",fit: BoxFit.fill,)


                  ),
                ),
              ),

              //   Name
              Text(
                gridItem[ind].name,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
              )
            ],
          );
        });
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
