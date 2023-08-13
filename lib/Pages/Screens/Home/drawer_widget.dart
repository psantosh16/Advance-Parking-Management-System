import 'package:apms_project/Theme/color_theme.dart';
import 'package:flutter/material.dart';

class HomePageDrawer extends StatelessWidget {
  const HomePageDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorTheme.whiteTheme,
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: <Widget>[

          // Header
          DrawerHeader(
            padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: ColorTheme.whiteTheme,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipOval(
                    child: SizedBox(
                      width: 90,
                      height: 90,
                      child: Image.network(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpqJKRFR7biVyccvSz_eloFoHh5zYRPvL4-xMOVcTUruSOT_2uV8_RAEg-I9qlYxYdCMo&usqp=CAU",
                        fit:BoxFit.cover
                      ),
                    ),
                  ),
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("John M", style: TextStyle(fontSize: 24 , fontWeight: FontWeight.bold),),
                      GestureDetector(
                          onTap: (){
                            // Navigate to profile update page
                          },
                          child: const Text("View Profile" , style: TextStyle(color: ColorTheme.blueTheme , fontSize: 20),))
                    ],
                  )
                ],
              )),


          // Navigation Sections
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Other
              Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.payment,size: 30,color: Colors.black,),
                    title: const Text('Wallet',style: TextStyle(fontSize: 20,fontWeight:FontWeight.w600),),
                    onTap: () {
                      // Navigator.pop(context);
                      Navigator.pushNamed(context, "/wallet");
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.history,size: 30,color: Colors.black,),
                    title: const Text('History',style: TextStyle(fontSize: 20,fontWeight:FontWeight.w600),),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings,size: 30,color: Colors.black,),
                    title: const Text('Setting',style: TextStyle(fontSize: 20,fontWeight:FontWeight.w600),),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),

              // Logout
              ListTile(
                leading: const Icon(Icons.logout,size: 30,color: Colors.black,),
                title: const Text('Log out',style: TextStyle(fontSize: 20,fontWeight:FontWeight.w600),),
                onTap: () {
                  // Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, "/login");
                },
              ),
            ],
          )

        ],
      ),
    );
  }
}
