import 'package:apms_project/Utils/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Controller/provider/slotbutton.dart';

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
      width: size.width / 3 - 10 / 3,
      height: size.height - 320,
      padding: const EdgeInsets.only(bottom: 5, top: 5),
      decoration: BoxDecoration(
          color: ColorTheme.whiteTheme,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: Colors.white)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Slot(full: true, slotnumber: "B-1", index: 1),
          Slot(full: false, slotnumber: "B-2", index: 2),
          Slot(full: true, slotnumber: "B-3", index: 3),
          Slot(full: false, slotnumber: "B-4", index: 4),
          Slot(full: true, slotnumber: "B-5", index: 5),
          Slot(full: false, slotnumber: "B-6", index: 6),
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
      width: size.width / 3 - 10 / 3,
      height: size.height - 320,
      padding: const EdgeInsets.only(bottom: 5, top: 5),
      decoration: BoxDecoration(
          color: ColorTheme.whiteTheme,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: Colors.white)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Slot(full: false, slotnumber: "B-7", index: 7),
          Slot(full: true, slotnumber: "B-8", index: 8),
          Slot(full: false, slotnumber: "B-9", index: 9),
          Slot(full: true, slotnumber: "B-10", index: 10),
          Slot(full: false, slotnumber: "B-11", index: 11),
          Slot(full: true, slotnumber: "B-12", index: 12),
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
  void showErrorMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        content: Center(
          child: Container(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 134, 134, 134),
                borderRadius: BorderRadius.circular(7)),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255), fontSize: 13.5),
            ),
          ),
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<ButtonController>(context, listen: false);
    final buttonController = Provider.of<ButtonController>(context);

    return Expanded(child: Consumer<ButtonController>(
      builder: (context, value, child) {
        return TextButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(3), // Adjust padding as needed
          ),
          onPressed: () {
            if (widget.full == true) {
              showErrorMessage(context,
                  "Unfortunately slot ${widget.slotnumber} is not available");
            } else {
              buttonController.onClickButton(widget.index);
            }
          },
          child: Container(
            decoration: BoxDecoration(
                color: value.containerColor[widget.index].value,
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
                                color: value.dashcolor[widget.index].value,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(top: 9),
                          child: Text(
                            widget.slotnumber,
                            style: TextStyle(
                                color: value.textcolor[widget.index].value,
                                fontWeight: FontWeight.bold,
                                fontSize: 13),
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
                                      image: AssetImage(
                                          "assets/images/ycar.png"))),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    ));
  }
}
