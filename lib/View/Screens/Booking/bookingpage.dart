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
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<ButtonController>(context, listen: false).unselect();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.whiteTheme,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
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
