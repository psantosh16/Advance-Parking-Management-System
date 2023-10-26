import 'package:apms_project/Controller/provider/slotbutton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Timeslot extends StatefulWidget {
  const Timeslot({super.key});

  @override
  State<Timeslot> createState() => _TimeslotState();
}

class _TimeslotState extends State<Timeslot> {
  @override
  Widget build(BuildContext context) {
    Provider.of<ButtonController>(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 255, 200),
      body: Center(
          child: Consumer<ButtonController>(builder: (context, value, child) {
        return Text(value.selectedslot);
      })),
    );
  }
}
