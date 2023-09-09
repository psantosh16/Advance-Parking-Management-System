import 'package:apms_project/View/Screens/Booking/slots.dart';
import 'package:apms_project/View/Screens/Booking/statusbar.dart';
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
      child: const Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Slotsleft(),
              Expanded(child: Text("")),
              Slotsright(),
            ],
          ),
          SizedBox(
            height: 17,
          ),
          Statusbutton()
        ],
      ),
    );
  }
}

       