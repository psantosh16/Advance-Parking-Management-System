// ignore_for_file: use_build_context_synchronously

import 'package:apms_project/Controller/provider/slotbutton.dart';
import 'package:apms_project/Utils/color_theme.dart';
import 'package:apms_project/Utils/responsive_util.dart';
import 'package:apms_project/Controller/provider/pickdate.dart';
import 'package:apms_project/View/Screens/Payment/after_payment.dart';
import 'package:apms_project/View/Screens/Payment/paymentGateway.dart';
import 'package:apms_project/View/auth/showmessage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Timeslot extends StatefulWidget {
  const Timeslot({super.key});

  @override
  State<Timeslot> createState() => _TimeslotState();
}

class _TimeslotState extends State<Timeslot> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<datepickprovider>(context, listen: false).reset();
    });
  }

  Future<int> fetchWalletBalance() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      final documentSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (documentSnapshot.exists) {
        final data = documentSnapshot.data() as Map<String, dynamic>;
        final walletBalance = data['walletBalance'] as int;
        return walletBalance;
      }
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<ButtonController>(context);
    // final datepickprovider = Provider.of<datepickprovider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
          title: Consumer<ButtonController>(builder: (context, value, child) {
        return Text(value.selectedslot);
      })),
      body: Consumer<datepickprovider>(
        builder: (context, value, child) {
          return Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                  width: double.infinity,
                  height: ResponsiveUtils.screenHeight(context) * 0.054,
                  margin: const EdgeInsets.only(right: 20, left: 20),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          backgroundColor:
                              const Color.fromARGB(255, 219, 219, 219)),
                      onPressed: () async {
                        value.Datepicker(context);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.calendar_month_outlined,
                              color: Colors.black,
                              size: ResponsiveUtils.screenWidth(context) * 0.06,
                            ),
                            Text(
                              value.formattedDate,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize:
                                      ResponsiveUtils.screenWidth(context) *
                                          0.04),
                            ),
                            Icon(Icons.keyboard_arrow_down_rounded,
                                size:
                                    ResponsiveUtils.screenWidth(context) * 0.06,
                                color: Colors.black)
                          ],
                        ),
                      ))),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        "Starting time",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize:
                                ResponsiveUtils.screenWidth(context) * 0.04),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: ResponsiveUtils.screenWidth(context) * 0.4,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7)),
                                backgroundColor:
                                    const Color.fromARGB(255, 219, 219, 219)),
                            onPressed: () async {
                              value.starttimepicker(context);
                            },
                            child: Container(
                              margin:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    value.starttime,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: ResponsiveUtils.screenWidth(
                                                context) *
                                            0.04),
                                  ),
                                  Icon(Icons.keyboard_arrow_down_rounded,
                                      size:
                                          ResponsiveUtils.screenWidth(context) *
                                              0.06,
                                      color: Colors.black)
                                ],
                              ),
                            )),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Ending time",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize:
                                ResponsiveUtils.screenWidth(context) * 0.04),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: ResponsiveUtils.screenWidth(context) * 0.4,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7)),
                                backgroundColor:
                                    const Color.fromARGB(255, 219, 219, 219)),
                            onPressed: () async {
                              value.endtimepicker(context);
                            },
                            child: Container(
                              margin:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    value.endtime,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: ResponsiveUtils.screenWidth(
                                                context) *
                                            0.04),
                                  ),
                                  Icon(Icons.keyboard_arrow_down_rounded,
                                      size:
                                          ResponsiveUtils.screenWidth(context) *
                                              0.06,
                                      color: Colors.black)
                                ],
                              ),
                            )),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: Container(
                  margin:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: const Color.fromARGB(255, 223, 222, 222),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Total Amount  :  ${value.amount}",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Consumer<ButtonController>(
                          builder: (context, value, child) {
                        return Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: const Text(
                            "",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 120,
                    height: 43,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onPressed: () async {
                        final amountToDeduce = value.amount;
                        final amount = await fetchWalletBalance();
                        if (amountToDeduce > amount) {
                          showDialog(
                              barrierColor: Colors.white,
                              barrierLabel: "Insufficient Balance Error",
                              context: context,
                              builder: (context) {
                                return SizedBox(
                                  width: 200,
                                  height: 200,
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "assets/images/wallet_error.png",
                                          // height: 200,
                                          // width: 100,
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const Text(
                                          "Oops...Insufficient Balance",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text("Close"),
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator
                                                    .pushNamedAndRemoveUntil(
                                                        context,
                                                        "/wallet",
                                                        (route) => false);
                                              },
                                              child: const Text("Add Money"),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              });
                        } else {
                          if (value.formattedDate == "Select Date") {
                            showmessage(context, "Please select date");
                          } else if (value.starttime.toString() == "Start" ||
                              value.endtime.toString() == "End") {
                            showmessage(context, "Please select time");
                          } else {
                            deductAmountFromWallet(amountToDeduce)
                                .then((value) {
                              const AlertDialog.adaptive(
                                title: Text("Please Wait..."),
                                content: CircularProgressIndicator.adaptive(),
                              );
                              afterPayment(context);
                            }).then(
                              (value) => showDialog(
                                barrierColor: Colors.white,
                                context: context,
                                builder: (context) {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Lottie.asset(
                                          "assets/images/payment_success.json",
                                          frameRate: FrameRate(60),
                                          repeat: false,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const Text("Booking Successful"),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      SizedBox(
                                        width: 120,
                                        height: 43,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            backgroundColor:
                                                ColorTheme.neogreenTheme,
                                            foregroundColor: Colors.black,
                                          ),
                                          onPressed: () {
                                            Navigator.pushNamedAndRemoveUntil(
                                                context,
                                                "/screen",
                                                (route) => false);
                                          },
                                          child: const Text("OK"),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            );
                          }
                        }
                      },
                      child: const Center(
                        child: Text(
                          "Pay using Wallet",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ),
                    ),
                  ),
                  PaymentGateway(
                    amount: value.amount,
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> deductAmountFromWallet(int amountToDeduct) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      final userRef =
          FirebaseFirestore.instance.collection('users').doc(user.uid);

      try {
        // Fetch the current walletBalance
        final DocumentSnapshot userSnapshot = await userRef.get();
        if (userSnapshot.exists) {
          final data = userSnapshot.data() as Map<String, dynamic>;
          final currentWalletBalance = data['walletBalance'] as int;

          if (currentWalletBalance >= amountToDeduct) {
            // Deduct the specified amount
            final newBalance = currentWalletBalance - amountToDeduct;
            // Update the walletBalance in Firestore
            await userRef.update({'walletBalance': newBalance});
          }
        }
      } catch (e) {
        // Handle any errors that may occur during the process
        debugPrint('Error deducting amount: $e');
      }
    }
  }
}
