import 'package:flutter/material.dart';

// ignore: camel_case_types
class datepickprovider extends ChangeNotifier {
  String formattedDate = "Select Date";
  int databasedate = 0;
  int databasetime = 0;
  String transactionId = "";
  String starttime = "Start";
  TimeOfDay? startingtime;
  String endtime = "End";
  TimeOfDay? endingtime;
  int amount = 2000;
  int hours = 0;
  void amountChange() {
    if (startingtime != null && endingtime != null) {
      hours = startingtime!.hour - endingtime!.hour;
      if (hours > 0) {
        hours = (24 - hours) * -1;
      }
      amount = hours * -10;
    }

    notifyListeners();
  }

  // ignore: non_constant_identifier_names
  void Datepicker(context) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2040));
    if (pickedDate != null) {
      formattedDate =
          "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
      databasedate =
          pickedDate.day + pickedDate.month * 100 + pickedDate.year * 10000;
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
    databasetime = endingtime!.hour;

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
      notifyListeners();
    }
  }

  void reset() {
    formattedDate = "Select Date";
    starttime = "Start";
    startingtime = null;
    endtime = "End";
    endingtime = null;
    amount = 10;
    hours = 0;
    notifyListeners();
  }
}
