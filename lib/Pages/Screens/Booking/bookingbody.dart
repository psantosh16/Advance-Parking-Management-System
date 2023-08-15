import 'package:apms_project/Pages/Screens/Booking/slots.dart';
import 'package:apms_project/Theme/color_theme.dart';
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
              Slotsleft(),
              Expanded(child: Text("")),
              Slotsright(),
            ],
          ),
          const SizedBox(
            height: 17,
          ),
          SizedBox(
            width: 140,
            height: 42,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                  backgroundColor: const Color.fromARGB(255, 199, 255, 41),
                  foregroundColor: ColorTheme.blackTheme,
                ),
                onPressed: () {},
                child: const Text(
                  "Book",
                  style: TextStyle(fontSize: FontTheme.buttonFontSize),
                )),
          )
        ],
      ),
    );
  }
}
