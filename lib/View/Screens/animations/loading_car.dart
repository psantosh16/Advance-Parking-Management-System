import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void loadingcar(context) {
  showDialog(
      context: context,
      builder: (context) {
        return Center(
            child: SizedBox(
                width: 250,
                child: LottieBuilder.asset("assets/images/car.json")));
      });
}
