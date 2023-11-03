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
  late Map<String, dynamic> data = {"name": " ", "imageurl": ""};
  Future<void> loadUserData() async {
    final result = await fetchData();
    setState(() {
      data = result;
    });
  }

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    List<String> nameParts = data['name'].split(' ');
    String firstName = nameParts.first;
    String lastName = nameParts.length > 1 ? nameParts.last : '';
    return Drawer(
      backgroundColor: ColorTheme.neogreenTheme,
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
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
                          width: 85,
                          height: 85,
                          child: data['imageurl'] == ""
                              ? const Center(
                                  child: Text(""),
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
                        firstName,
                        style: TextStyle(
                            fontSize:
                                ResponsiveUtils.textScaleFactor(context) * 25,
                            fontWeight: FontWeight.bold),
                      ),
                      if (lastName.isNotEmpty)
                        Text(
                          lastName, // Display the last name if it's not empty
                          style: TextStyle(
                            fontSize:
                                ResponsiveUtils.textScaleFactor(context) * 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      const SizedBox(
                        height: 5,
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
          ListTile(
            leading: Icon(
              Icons.payment,
              size: ResponsiveUtils.textScaleFactor(context) * 30,
              color: Colors.black,
            ),
            title: Text(
              'Wallet',
              style: TextStyle(
                  fontSize: ResponsiveUtils.textScaleFactor(context) * 20,
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
                  fontSize: ResponsiveUtils.textScaleFactor(context) * 20,
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
            title: InkWell(
              onTap: () => Navigator.pushNamed(context, "/profile"),
              child: Text(
                'Setting',
                style: TextStyle(
                    fontSize: ResponsiveUtils.textScaleFactor(context) * 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
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
              FirebaseAuth.instance.signOut().then(
                  (value) => Navigator.pushReplacementNamed(context, "/login"));
            },
          )

          // Logout
        ],
      ),
    );
  }
}
