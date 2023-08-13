import 'package:apms_project/Pages/Screens/Home/Booking/slots.dart';
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
      margin: const EdgeInsets.only(top: 30),
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
            height: 30,
          ),
          Center(
              child: TextButton(
                  onPressed: () {},
                  child: Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 247, 27),
                        borderRadius: BorderRadius.circular(12)),
                    child: const Center(
                        child: Text(
                      "Book",
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )),
                  )))
        ],
      ),
    );
  }
}
