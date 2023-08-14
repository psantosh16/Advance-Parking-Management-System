import 'package:flutter/material.dart';

class Appbartitle extends StatelessWidget {
  const Appbartitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          margin: const EdgeInsets.only(left: 5, right: 5),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 8),
                child: IconButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.navigate_before_rounded,
                      color: Colors.black,
                      size: 40,
                    )),
              ),
              const Text(
                "Book Your Slot",
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        )
      ;
  }
}