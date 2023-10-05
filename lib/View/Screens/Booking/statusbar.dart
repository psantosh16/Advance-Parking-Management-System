import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Controller/provider/slotbutton.dart';
import '../../../Utils/color_theme.dart';

class Statusbutton extends StatefulWidget {
  const Statusbutton({super.key});

  @override
  State<Statusbutton> createState() => _StatusbuttonState();
}

class _StatusbuttonState extends State<Statusbutton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 65,
          child: Container(
            margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: const Color.fromARGB(255, 223, 222, 222),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: const Text(
                    "Booking Status  :",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Consumer<ButtonController>(builder: (context, value, child) {
                  return Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Text(
                      "${value.selectedslot}  ",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
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
    );
  }
}
