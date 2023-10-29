import 'package:apms_project/Utils/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Controller/provider/slotbutton.dart';
import 'bookingbody.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});
  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override
  Widget build(BuildContext context) {
    Provider.of<ButtonController>(context, listen: false);
    final buttonController = Provider.of<ButtonController>(context);
    return Scaffold(
      backgroundColor: ColorTheme.whiteTheme,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            if (buttonController.selectedindex != 100) {
              buttonController.unselect();
              buttonController.selectedslot = "None Selected";
            }
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: ColorTheme.blackTheme,
        automaticallyImplyLeading: false,
        title: const Text("Pick your spot"),
      ),
      body: const Bookingbody(),
    );
  }
}
