import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void handleDelete({required BuildContext context, required String docId}) {
  FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection('transactions')
      .doc(docId)
      .delete();
}

Future<Map<String, dynamic>> fetchData() async {
  DocumentSnapshot user = await FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .get();
  // ignore: non_constant_identifier_names
  Map<String, dynamic> Data = user.data() as Map<String, dynamic>;
  return Data;
}