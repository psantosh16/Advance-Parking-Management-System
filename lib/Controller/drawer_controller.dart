import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerControllers extends GetxController {
  // Declaration of Scaffold Key
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Getter to get Scaffold Key
  GlobalKey<ScaffoldState> get scaffoldKey =>
      _scaffoldKey; // Use the existing scaffoldKey

  // Method to open drawer
  void openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }
}
