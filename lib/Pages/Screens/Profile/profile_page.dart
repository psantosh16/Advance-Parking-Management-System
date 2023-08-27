import 'package:apms_project/Pages/Screens/Profile/profile_model.dart';
import 'package:flutter/material.dart';

import '../../../Utils/color_theme.dart';
import '../../../Utils/responsive_util.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // DashBoard List
  final List<ProfileModel> _dashboardList = [
    ProfileModel(name: 'Payment', icon: Icons.wallet, color: Colors.green),
    ProfileModel(name: "Discounts", icon: Icons.discount, color: Colors.yellow.shade700),
    ProfileModel(name: "Privacy", icon: Icons.privacy_tip, color: Colors.grey.shade400)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text("My Profile" ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(height: 40,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipOval(
                        child: Placeholder(
                          color: ColorTheme.grayTheme,
                          strokeWidth: 100,
                          child: SizedBox(
                            width: 94,
                            height: 94,
                            child: Image.network(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpqJKRFR7biVyccvSz_eloFoHh5zYRPvL4-xMOVcTUruSOT_2uV8_RAEg-I9qlYxYdCMo&usqp=CAU",
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "John M",
                            style: TextStyle(
                                fontSize:
                                    ResponsiveUtils.textScaleFactor(context) * 32,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(Icons.edit , color: Colors.grey,),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Navigate to profile update page
                                },
                                child: Text(
                                  "Edit profile",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize:
                                          ResponsiveUtils.textScaleFactor(context) *
                                              16),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 40,),
                  Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Dashboard",
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: ResponsiveUtils.textScaleFactor(context) * 18),
                      ),

                      SizedBox(
                          height: ResponsiveUtils.screenHeight(context)*0.3,
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: _dashboardList.length,
                            itemBuilder: (context, idx) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: ListTile(
                                  contentPadding: EdgeInsets.zero,

                                  leading: ClipOval(
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      height: ResponsiveUtils.screenHeight(context)*0.06,
                                      width: ResponsiveUtils.screenHeight(context)*0.06,
                                      decoration: BoxDecoration(
                                          color: _dashboardList[idx].color),
                                      child: Icon(_dashboardList[idx].icon,size: ResponsiveUtils.textScaleFactor(context)* 24, color: Colors.white,),
                                    ),
                                  ),
                                  title: Text(
                                    _dashboardList[idx].name,
                                    style: TextStyle(
                                        fontSize:
                                            ResponsiveUtils.textScaleFactor(context) *
                                                18,color: Colors.black,),
                                  ),
                                  trailing: const Icon(Icons.arrow_forward_ios),
                                ),
                              );
                            },
                          ))
                    ],
                  ),
                  const SizedBox(height: 40,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "My Account",
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: ResponsiveUtils.textScaleFactor(context) * 18),
                      ),
                      const SizedBox(height: 18,),
                      Text(
                        "Switch to other account",
                        style: TextStyle(
                            color: ColorTheme.blueTheme,
                            fontSize: ResponsiveUtils.textScaleFactor(context) * 20 , fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 18,),
                      Text(
                        "Log Out",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: ResponsiveUtils.textScaleFactor(context) * 20 , fontWeight: FontWeight.bold),
                      ),

                    ],
                  ),

                ],
              ),
            ),
          ],
        ));
  }
}
