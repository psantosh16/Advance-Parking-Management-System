import 'dart:math';

import 'package:apms_project/Controller/ParkingController/parking_spot_controller.dart';
import 'package:apms_project/Controller/provider/pickdate.dart';
import 'package:apms_project/Controller/provider/slotbutton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void afterPayment(context) async {
  final dateprovider = Provider.of<datepickprovider>(context, listen: false);
  final buttoncontroller =
      Provider.of<ButtonController>(context, listen: false);
  final parkingSpot = Provider.of<ParkingSpotProvider>(context, listen: false);

  String generateRandomString(int length) {
    const characters =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
    final rand = Random();
    final maxIndex = characters.length;
    String randomString = '';

    for (int i = 0; i < length; i++) {
      final randomIndex = rand.nextInt(maxIndex);
      randomString += characters[randomIndex];
    }

    print(randomString);
    return randomString;
  }

  try {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("transactions")
        .doc()
        .set(
      {
        "date": dateprovider.formattedDate,
        "starttime": dateprovider.starttime,
        "endtime": dateprovider.endtime,
        "slot": "B-${buttoncontroller.selectedindex}",
        "place": parkingSpot.selectedParkingSpot.name,
        "datetime": dateprovider.databasedate * 100 + dateprovider.databasetime,
        "transaction_amount": dateprovider.amount,
        "transactionId": dateprovider.transactionId != '' &&
                // ignore: unnecessary_null_comparison
                dateprovider.transactionId != null
            ? dateprovider.transactionId
            : generateRandomString(8),
      },
    );
    debugPrint("Data written to Firestore successfully.");
  } catch (e) {
    debugPrint("Error writing data to Firestore: $e");
  }
}
