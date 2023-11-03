import 'package:apms_project/Utils/color_theme.dart';
import 'package:apms_project/Utils/responsive_util.dart';
import 'package:apms_project/View/Screens/Home/firebase_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../auth/showmessage.dart';

class Booked extends StatefulWidget {
  const Booked({super.key});

  @override
  State<Booked> createState() => _BookedState();
}

class _BookedState extends State<Booked> {
  @override
  Widget build(BuildContext context) {
    int time = DateTime.now().year * 1000000 +
        DateTime.now().month * 10000 +
        DateTime.now().day * 100 +
        DateTime.now().hour;

    final Stream<QuerySnapshot> transactions = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('transactions')
        .orderBy('datetime', descending: false)
        .snapshots();

    return Scaffold(
        appBar: AppBar(
          title: const Text("Booked"),
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: transactions,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                showmessage(context, "Something went wrong");
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              if (snapshot.hasData) {
                final List<DocumentSnapshot> documents = snapshot.data!.docs;
                return Column(
                  children: documents.map((data) {
                    if (data['datetime'] < time) {
                      handleDelete(
                          context: context,
                          docId: data.id,
                          amount: data['transaction_amount']);
                    }
                    return Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Card(
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          margin: const EdgeInsets.symmetric(horizontal: 24),
                          child: SizedBox(
                            height:
                                ResponsiveUtils.screenHeight(context) * 0.215,
                            width: ResponsiveUtils.screenWidth(context),
                            child: Column(
                              children: [
                                Container(
                                  height:
                                      ResponsiveUtils.screenHeight(context) *
                                          0.05,
                                  width: ResponsiveUtils.screenWidth(context),
                                  decoration: const BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          topRight: Radius.circular(12))),
                                  child: Center(
                                      child: Row(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                          "assets/images/Plogo.png"),
                                    ),
                                    Text(
                                      data['slot'],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22),
                                    )
                                  ])),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data['place'],
                                        style: const TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Date: ${data['date']}",
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        "Time: ${data['starttime']} - ${data['endtime']}",
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          ElevatedButton(
                                            style: ButtonStyle(
                                              side: MaterialStateProperty
                                                  .all<BorderSide>(BorderSide(
                                                      color: Colors.red[400]!,
                                                      width: 2)),
                                              backgroundColor:
                                                  MaterialStateProperty.all<
                                                      Color>(Colors.white),
                                            ),
                                            onPressed: () {
                                              showDialog(
                                                  barrierColor: Colors.white,
                                                  context: context,
                                                  builder: (context) {
                                                    return Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Lottie.asset(
                                                          "assets/images/cancel.json",
                                                          repeat: false,
                                                        ),
                                                        const SizedBox(
                                                          height: 4,
                                                        ),
                                                        const Text(
                                                          "Cancelled Successfully",
                                                          style: TextStyle(
                                                              fontSize: 24,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        const Text(
                                                          "Refund will be initiated to Parkiza Wallet",
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            color:
                                                                Color.fromARGB(
                                                                    137,
                                                                    114,
                                                                    114,
                                                                    114),
                                                          ),
                                                        ),
                                                        ElevatedButton(
                                                          style: ButtonStyle(
                                                            backgroundColor:
                                                                MaterialStateProperty.all<
                                                                        Color>(
                                                                    ColorTheme
                                                                        .neogreenTheme),
                                                          ),
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: const Text(
                                                            "Ok",
                                                            style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  }).then((value) {
                                                handleDelete(
                                                    context: context,
                                                    docId: data.id,
                                                    amount: data[
                                                        'transaction_amount']);
                                              });
                                            },
                                            child: Text("Cancel",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.red[400],
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ));
                  }).toList(),
                );
              }
              return Container();
            }));
  }
}
