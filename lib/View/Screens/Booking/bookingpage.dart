import 'package:apms_project/Controller/ParkingController/parking_spot_controller.dart';
import 'package:apms_project/Utils/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Controller/provider/slotbutton.dart';
import 'bookingbody.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});
  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<ButtonController>(context, listen: false).unselect();
    });
  }

  @override
  Widget build(BuildContext context) {
    final parkingController =
        Provider.of<ParkingSpotProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: ColorTheme.whiteTheme,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: ColorTheme.blackTheme,
        automaticallyImplyLeading: false,
        title: Text(parkingController.selectedParkingSpot.name),
      ),
      body: const Bookingbody(),
    );
  }
}
