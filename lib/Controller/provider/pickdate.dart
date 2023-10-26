import 'package:flutter/material.dart';

// ignore: camel_case_types
class datepickprovider extends ChangeNotifier {
  String formattedDate = "Select Date";
  TimeOfDay? Endingtime;
  String Endtime = "";
  TimeOfDay? Startingtime;
  String Starttime = "";

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

  Future<void> Endtimepicker(BuildContext context) async {
    Endingtime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );
    // ignore: use_build_context_synchronously
    Endtime = Endingtime!.format(context);
    if (Endingtime != null) {
      notifyListeners(); // Notify listeners that the selected time has changed.
    }
  }

  Future<void> Starttimepicker(BuildContext context) async {
    Startingtime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );
    // ignore: use_build_context_synchronously
    Starttime = Startingtime!.format(context);
    if (Startingtime != null) {
      notifyListeners(); // Notify listeners that the selected time has changed.
    }
  }
}
