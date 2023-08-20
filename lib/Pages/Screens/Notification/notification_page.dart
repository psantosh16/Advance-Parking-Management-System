import 'package:apms_project/GlobalState/parking_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  late ParkingSpotController spotController = Get.put(ParkingSpotController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Experimental
        child: Obx(
          () => Text("${spotController.parkingSpotName}"),
        ),
      ),
    );
  }
}
