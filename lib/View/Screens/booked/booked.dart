import 'package:apms_project/Utils/responsive_util.dart';
import 'package:apms_project/View/Screens/Home/firebase_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../auth/showmessage.dart';

class Booked extends StatefulWidget {
  const Booked({super.key});

  @override
  State<Booked> createState() => _BookedState();
}

class _BookedState extends State<Booked> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> transactions = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('transactions')
        .orderBy('date', descending: false)
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
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 8,
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
                                      padding: const EdgeInsets.all(6.0),
                                      child: Image.asset(
                                          "assets/images/Plogo.png"),
                                    ),
                                    Text(
                                      data['slot'],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24),
                                    )
                                  ])),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data['place'],
                                            style: const TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            data['date'],
                                            style: const TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                          Text(
                                            "${data['starttime']} - ${data['endtime']}",
                                            style: const TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              ElevatedButton(
                                                style: ButtonStyle(
                                                  side: MaterialStateProperty
                                                      .all<BorderSide>(
                                                          BorderSide(
                                                              color: Colors
                                                                  .red[400]!,
                                                              width: 2)),
                                                  backgroundColor:
                                                      MaterialStateProperty.all<
                                                          Color>(Colors.white),
                                                ),
                                                onPressed: () {
                                                  handleDelete(
                                                      context: context,
                                                      docId: data.id);
                                                },
                                                child: Text("Cancel",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.red[400],
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                              SizedBox(
                                                width:
                                                    ResponsiveUtils.screenWidth(
                                                            context) *
                                                        0.1,
                                              ),
                                              // ElevatedButton(
                                              //   style: ButtonStyle(
                                              //     backgroundColor:
                                              //         MaterialStateProperty.all<
                                              //                 Color>(
                                              //             Colors.blue[400]!),
                                              //   ),
                                              //   onPressed: () {
                                              //     Navigator.pushNamed(
                                              //         context, "/booked");
                                              //   },
                                              //   child: const Text("See Other",
                                              //       style: TextStyle(
                                              //           fontSize: 18,
                                              //           color: Colors.white,
                                              //           fontWeight:
                                              //               FontWeight.bold)),
                                              // ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
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
