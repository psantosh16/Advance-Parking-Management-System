import 'package:flutter/material.dart';
import 'appbar.dart';
import 'bookingbody.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 70, 70, 70),
      appBar: AppBar(
          toolbarHeight: 60,
          titleSpacing: 0,
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 70, 70, 70),
          automaticallyImplyLeading: false,
          title: const Appbartitle()),
      body: const Bookingbody(),
    );
  }
}
