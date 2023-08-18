import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonController extends GetxController {
  var isButtonClicked = List.generate(13, (index) => true.obs);
  var containerColor = const Color.fromARGB(255, 0, 0, 0).obs;
  var textcolor = const Color.fromARGB(255, 191, 191, 191).obs;
  var dashcolor = const Color.fromARGB(255, 255, 255, 255).obs;
  void onClickButton(int index) {
    // ignore: unrelated_type_equality_checks
    if (isButtonClicked[index].value == true ) {
      isButtonClicked[index].value = false;
      containerColor.value = const Color.fromARGB(255, 199, 255, 41);
      textcolor.value = const Color.fromARGB(255, 0, 0, 0);
      dashcolor.value = const Color.fromARGB(255, 0, 0, 0);
    } else {
      isButtonClicked[index].value = true;
      containerColor.value = const Color.fromARGB(255, 0, 0, 0);
      textcolor.value = const Color.fromARGB(255, 191, 191, 191);
      dashcolor.value = const Color.fromARGB(255, 255, 255, 255);
    }
  }
}
