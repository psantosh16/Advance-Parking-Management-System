import 'package:apms_project/Utils/color_theme.dart';
import 'package:apms_project/Utils/responsive_util.dart';
import 'package:apms_project/View/Screens/Home/firebase_controller.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePageDrawer extends StatefulWidget {
  const HomePageDrawer({
    super.key,
  });

  @override
  State<HomePageDrawer> createState() => _HomePageDrawerState();
}

class _HomePageDrawerState extends State<HomePageDrawer> {
  late Map<String, dynamic> data = {"name": "...", "imageurl": ""};
  @override
  void initState() {
    super.initState();
    fetchData().then((result) {
      setState(() {
        data = result; // Assign the fetched data to the 'data' list.
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorTheme.neogreenTheme,
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: <Widget>[
          // Header
          DrawerHeader(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: ColorTheme.neogreenTheme,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipOval(
                    child: Placeholder(
                      color: ColorTheme.grayTheme,
                      strokeWidth: 100,
                      child: SizedBox(
                          width: 90,
                          height: 90,
                          child: data['imageurl'] == ""
                              ? const Center(
                                  child: CircularProgressIndicator.adaptive(),
                                )
                              : Image.network(data['imageurl'] ?? "",
                                  fit: BoxFit.cover)),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data['name'],
                        style: TextStyle(
                            fontSize:
                                ResponsiveUtils.textScaleFactor(context) * 25,
                            fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/profile',
                              arguments: {
                                'imageurl': data['imageurl'],
                                'name': data['name'],
                              },
                            );
                          },
                          child: Text(
                            "View Profile",
                            style: TextStyle(
                                color: ColorTheme.blueTheme,
                                fontSize:
                                    ResponsiveUtils.textScaleFactor(context) *
                                        14),
                          ))
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
                    leading: Icon(
                      Icons.payment,
                      size: ResponsiveUtils.textScaleFactor(context) * 30,
                      color: Colors.black,
                    ),
                    title: Text(
                      'Wallet',
                      style: TextStyle(
                          fontSize:
                              ResponsiveUtils.textScaleFactor(context) * 20,
                          fontWeight: FontWeight.w600),
                    ),
                    onTap: () {
                      // Navigator.pop(context);
                      Navigator.pushNamed(context, "/wallet");
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.history,
                      size: ResponsiveUtils.textScaleFactor(context) * 30,
                      color: Colors.black,
                    ),
                    title: Text(
                      'History',
                      style: TextStyle(
                          fontSize:
                              ResponsiveUtils.textScaleFactor(context) * 20,
                          fontWeight: FontWeight.w600),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.settings,
                      size: ResponsiveUtils.textScaleFactor(context) * 30,
                      color: Colors.black,
                    ),
                    title: Text(
                      'Setting',
                      style: TextStyle(
                          fontSize:
                              ResponsiveUtils.textScaleFactor(context) * 20,
                          fontWeight: FontWeight.w600),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),

              // Logout
              ListTile(
                leading: Icon(
                  Icons.logout,
                  size: ResponsiveUtils.textScaleFactor(context) * 30,
                  color: Colors.black,
                ),
                title: Text(
                  'Log out',
                  style: TextStyle(
                      fontSize: ResponsiveUtils.textScaleFactor(context) * 20,
                      fontWeight: FontWeight.w600),
                ),
                onTap: () {
                  FirebaseAuth.instance.signOut();
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
