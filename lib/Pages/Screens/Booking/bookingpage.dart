import 'package:apms_project/Theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'bookingbody.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.whiteTheme,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.pushReplacementNamed(context, '/screen');
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
         centerTitle: false,
          backgroundColor: ColorTheme.blackTheme,
          automaticallyImplyLeading: false,
          title: const Text("Book your slot"),),
      body: const Bookingbody(),
    );
  }
}
