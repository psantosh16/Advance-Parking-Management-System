import 'package:apms_project/Utils/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../GlobalState/slotbutton.dart';

class Slotsleft extends StatefulWidget {
  const Slotsleft({super.key});

  @override
  State<Slotsleft> createState() => _SlotsleftState();
}

class _SlotsleftState extends State<Slotsleft> {
  bool full = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width / 3 - 40 / 3,
      height: size.height - 320,
      padding: const EdgeInsets.only(bottom: 5, top: 5),
      decoration: BoxDecoration(
          color: ColorTheme.whiteTheme,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: Colors.white)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Slot(full: true, slotnumber: "A12304", index: 1),
          Slot(full: false, slotnumber: "B13304", index: 2),
          Slot(full: true, slotnumber: "C52004", index: 3),
          Slot(full: false, slotnumber: "D12301", index: 4),
          Slot(full: true, slotnumber: "A12101", index: 5),
          Slot(full: false, slotnumber: "A11101", index: 6),
        ],
      ),
    );
  }
}

class Slotsright extends StatefulWidget {
  const Slotsright({super.key});

  @override
  State<Slotsright> createState() => _SlotsrightState();
}

class _SlotsrightState extends State<Slotsright> {
  bool full = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width / 3 - 40 / 3,
      height: size.height - 320,
      padding: const EdgeInsets.only(bottom: 5, top: 5),
      decoration: BoxDecoration(
          color: ColorTheme.whiteTheme,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: Colors.white)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Slot(full: false, slotnumber: "A12314", index: 7),
          Slot(full: true, slotnumber: "B93304", index: 8),
          Slot(full: false, slotnumber: "C02004", index: 9),
          Slot(full: true, slotnumber: "D62301", index: 10),
          Slot(full: false, slotnumber: "A18101", index: 11),
          Slot(full: true, slotnumber: "A47101", index: 12),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class Slot extends StatefulWidget {
  bool full = false;
  String slotnumber = "";
  int index;

  Slot(
      {super.key,
      required this.full,
      required this.slotnumber,
      required this.index});

  @override
  State<Slot> createState() => _SlotState();
}

class _SlotState extends State<Slot> {
  final ButtonController _buttonController = Get.put(ButtonController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: TextButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(5), // Adjust padding as needed
      ),
      onPressed: () {
        _buttonController.onClickButton(widget.index);
        setState(() {});
      },
      child: Container(
        decoration: BoxDecoration(
            color: _buttonController.containerColor.value,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 6),
                      alignment: Alignment.center,
                      child: Text(
                        "--- --- --- ---",
                        style: TextStyle(
                            color: _buttonController.dashcolor.value,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(top: 6),
                      child: Text(
                        widget.slotnumber,
                        style: TextStyle(
                            color: _buttonController.textcolor.value,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                    )
                  ],
                ),
                widget.full
                    ? Center(
                        child: Container(
                          width: 55,
                          height: 30,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("assets/images/ycar.png"))),
                        ),
                      )
                    : Container(),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
