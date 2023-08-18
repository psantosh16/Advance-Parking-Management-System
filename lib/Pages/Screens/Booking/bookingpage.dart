import 'package:apms_project/Utils/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../GlobalState/slotbutton.dart';
import 'bookingbody.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});
  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final ButtonController _buttonController = Get.put(ButtonController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.whiteTheme,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
            for (var i = 0; i < 13; i++) {
              _buttonController.isButtonClicked[i].value = true;
            }
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
        centerTitle: false,
        backgroundColor: ColorTheme.blackTheme,
        automaticallyImplyLeading: false,
        title: const Text("Book your slot"),
      ),
      body: const Bookingbody(),
    );
  }
}
