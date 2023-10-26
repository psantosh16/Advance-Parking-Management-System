import 'package:flutter/material.dart';

// ignore: camel_case_types
class datepickprovider extends ChangeNotifier {
  String formattedDate = "Select Date";
  String starttime = "";
  TimeOfDay? startingtime;
  String endtime = "";
  TimeOfDay? endingtime;
  int amount = 2000;
  int hours = 0;
  void amountChange() {
    if (startingtime != null && endingtime != null) {
      hours = startingtime!.hour - endingtime!.hour;
      if (hours > 0) {
        hours = (24 - hours) * -1;
      }
      amount = hours * -200;
    }

    notifyListeners();
  }

  // ignore: non_constant_identifier_names
  void Datepicker(context) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1990),
        lastDate: DateTime.now());
    if (pickedDate != null) {
      formattedDate =
          "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
    } else {
      // The user canceled the date picker.
      return null;
    }

    notifyListeners();
  }

  Future<void> endtimepicker(BuildContext context) async {
    endingtime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );
    // ignore: use_build_context_synchronously
    endtime = endingtime!.format(context);
    if (endingtime != null) {
      if (startingtime != null) {
        amountChange();
      }
      notifyListeners(); // Notify listeners that the selected time has changed.
    }
  }

  Future<void> starttimepicker(BuildContext context) async {
    startingtime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );
    // ignore: use_build_context_synchronously
    starttime = startingtime!.format(context);
    if (startingtime != null) {
      if (endingtime != null) {
        amountChange();
      }
      notifyListeners(); // Notify listeners that the selected time has changed.
    }
  }

  void reset() {
    formattedDate = "Select Date";
    starttime = "";
    startingtime = null;
    endtime = "";
    endingtime = null;
    amount = 2000;
    hours = 0;
    notifyListeners();
  }
}
