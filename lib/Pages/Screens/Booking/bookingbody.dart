import 'package:apms_project/Pages/Screens/Booking/slots.dart';
import 'package:apms_project/Utils/color_theme.dart';
import 'package:flutter/material.dart';

class Bookingbody extends StatefulWidget {
  const Bookingbody({super.key});

  @override
  State<Bookingbody> createState() => _BookingbodyState();
}

class _BookingbodyState extends State<Bookingbody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
           const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Slots(),
              Expanded(child: Text("")),
              Slots(),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            width: 120,
            height: 40,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorTheme.neogreenTheme,
                  foregroundColor: ColorTheme.blackTheme,
                ),
                onPressed: (){}, child: const Text("Book",style: TextStyle(fontSize: FontTheme.buttonFontSize),)),
          )
        ],
      ),
    );
  }
}
