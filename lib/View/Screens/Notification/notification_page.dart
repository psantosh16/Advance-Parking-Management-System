import 'package:apms_project/Controller/ParkingController/parking_spot_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> trx = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('transactions')
        .orderBy('date', descending: false)
        .snapshots();

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: StreamBuilder<QuerySnapshot>(
            stream: trx,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text("Loading");
              } else if (snapshot.data!.docs.isEmpty) {
                return const Center(
                  child: Text("No Transactions"),
                );
              } else {
                return ListView(
                  children: snapshot.data!.docs.map((DocumentSnapshot doc) {
                    Map<String, dynamic> data =
                        doc.data()! as Map<String, dynamic>;
                    return Container(
                      margin: EdgeInsets.all(12),
                      child: Card(
                        child: ListTile(
                          title: Text(data['place']),
                          subtitle: Text(data['date']),
                          trailing: Text(
                              '₹ ${data['transaction_amount'].toString()}'),
                        ),
                      ),
                    );
                  }).toList(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
