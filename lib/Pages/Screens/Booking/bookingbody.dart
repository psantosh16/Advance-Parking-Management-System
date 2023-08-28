import 'package:apms_project/Pages/Screens/Booking/slots.dart';
import 'package:apms_project/Utils/color_theme.dart';
import 'package:apms_project/Utils/responsive_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../GlobalState/parking_controller.dart';

class Bookingbody extends StatefulWidget {
  const Bookingbody({super.key});

  @override
  State<Bookingbody> createState() => _BookingbodyState();
}

class _BookingbodyState extends State<Bookingbody> {
  late ParkingSpotController spotController = Get.put(ParkingSpotController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        margin: const EdgeInsets.only(top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Slotsleft(),
                Expanded(child: Text("")),
                Slotsright(),
              ],
            ),
            // const SizedBox(
            //   height: 17,
            // ),
            SizedBox(
              width: ResponsiveUtils.screenWidth(context),
              height: ResponsiveUtils.screenHeight(context) * 0.06,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    backgroundColor: const Color.fromARGB(255, 199, 255, 41),
                    foregroundColor: ColorTheme.blackTheme,
                  ),
                  onPressed: () {

                  },
                  child: Text(
                    "Proceed with spot (${spotController.slotSelected})",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
