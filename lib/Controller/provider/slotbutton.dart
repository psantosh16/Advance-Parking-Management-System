import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonController extends ChangeNotifier {
  var isButtonClicked = List.generate(13, (index) => true.obs);
  var containerColor =
      List.generate(13, (index) => const Color.fromARGB(255, 0, 0, 0).obs);
  var textcolor = List.generate(
      13, (index) => const Color.fromARGB(255, 191, 191, 191).obs);
  var dashcolor = List.generate(
      13, (index) => const Color.fromARGB(255, 255, 255, 255).obs);
  var selectedindex = 100;
  var selectedslot = "None Selected";

  void onClickButton(int index) {
    // ignore: unrelated_type_equality_checks
    if (selectedindex != 100 && selectedindex != index) {
      isButtonClicked[selectedindex].value = true;
      containerColor[selectedindex].value = const Color.fromARGB(255, 0, 0, 0);
      textcolor[selectedindex].value = const Color.fromARGB(255, 191, 191, 191);
      dashcolor[selectedindex].value = const Color.fromARGB(255, 255, 255, 255);
      selectedindex = 100;
    }
    if (isButtonClicked[index].value == true && selectedindex == 100) {
      isButtonClicked[index].value = false;

      containerColor[index].value = const Color.fromARGB(255, 199, 255, 41);
      textcolor[index].value = const Color.fromARGB(255, 0, 0, 0);
      dashcolor[index].value = const Color.fromARGB(255, 0, 0, 0);
      selectedindex = index;
      selectedslot = "B-$index Selected";
    } else {
      isButtonClicked[index].value = true;
      containerColor[index].value = const Color.fromARGB(255, 0, 0, 0);
      textcolor[index].value = const Color.fromARGB(255, 191, 191, 191);
      dashcolor[index].value = const Color.fromARGB(255, 255, 255, 255);
      selectedindex = 100;
      selectedslot = "None Selected";
    }
    notifyListeners();
  }

  void unselect() {
    if (selectedindex != 100) {
      isButtonClicked[selectedindex].value = true;
      containerColor[selectedindex].value = const Color.fromARGB(255, 0, 0, 0);
      textcolor[selectedindex].value = const Color.fromARGB(255, 191, 191, 191);
      dashcolor[selectedindex].value = const Color.fromARGB(255, 255, 255, 255);
      isButtonClicked[selectedindex].value = true;
      selectedindex = 100;
      selectedslot = "None Selected";
      notifyListeners();
    }
  }
}
