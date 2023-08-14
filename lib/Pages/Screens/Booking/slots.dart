import 'package:apms_project/Theme/color_theme.dart';
import 'package:flutter/material.dart';

class Slots extends StatefulWidget {
  const Slots({super.key});

  @override
  State<Slots> createState() => _SlotsState();
}

class _SlotsState extends State<Slots> {
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
          Slot(
            full: true,
            slotnumber: "A12304",
          ),
          Slot(
            full: false,
            slotnumber: "B13304",
          ),
          Slot(
            full: true,
            slotnumber: "C52004",
          ),
          Slot(
            full: false,
            slotnumber: "D12301",
          ),
          Slot(
            full: true,
            slotnumber: "A12101",
          ),
          Slot(
            full: false,
            slotnumber: "A11101",
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class Slot extends StatefulWidget {
  bool full = false;
  String slotnumber = "";
  Slot({super.key, required this.full, required this.slotnumber});
  @override
  State<Slot> createState() => _SlotState();
}

class _SlotState extends State<Slot> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: TextButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(5), // Adjust padding as needed
      ),
      onPressed: () {},
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 0, 0, 0),
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
                      child: const Text(
                        "--- --- --- ---",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(top: 6),
                      child: Text(
                        widget.slotnumber,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 191, 191, 191),
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
