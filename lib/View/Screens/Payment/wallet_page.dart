// ignore_for_file: avoid_print
import 'package:apms_project/Utils/responsive_util.dart';
import 'package:apms_project/View/Screens/Home/firebase_controller.dart';
import 'package:apms_project/View/Screens/Payment/razorpay.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  int walletBalance = 0;
  late Map<String, dynamic> data = {"name": " ", "imageurl": ""};
  Future<void> loadUserData() async {
    final result = await fetchData();
    setState(() {
      data = result;
    });
  }

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  final Stream<DocumentSnapshot> _walletStream = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .snapshots();

  int _topUpAmount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 197, 229, 137),
        appBar: AppBar(
          title: const Text("Wallet"),
          leading: InkWell(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, "/screen", (route) => false);
            },
            child: const Icon(Icons.arrow_back_ios_new),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: ResponsiveUtils.screenHeight(context) * 0.04),
            Center(
              child: data['imageurl'] == ""
                  ? const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.blue,
                      child: Icon(
                        Icons.person,
                        size: 20,
                        color: Colors.white,
                      ),
                    )
                  : CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                        data['imageurl'],
                      ),
                    ),
            ),
            Center(
                child: Text(
              data['name'],
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 120,
                  width: ResponsiveUtils.screenWidth(context) * 0.88,
                  margin: const EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  // Wallet Card
                  child: Center(
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        const Text(
                          "Available Balance",
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 32, 32, 32),
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          child: StreamBuilder(
                            stream: _walletStream,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                walletBalance =
                                    snapshot.data!.get('walletBalance');
                                return Text(
                                  "₹$walletBalance",
                                  style: const TextStyle(
                                    fontSize: 50,
                                    color: Colors.black,
                                  ),
                                );
                              } else if (snapshot.hasError) {
                                return const Text("Loading...");
                              } else {
                                return const Text("Add Money to start journey");
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 26),
              child: SizedBox(
                height: 43,
                width: ResponsiveUtils.screenWidth(context) * 0.88,
                child: ElevatedButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(
                      Colors.black,
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                        showDragHandle: true,
                        isScrollControlled: true,
                        isDismissible: false,
                        useSafeArea: true,
                        enableDrag: true,
                        shape: ShapeBorder.lerp(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          1,
                        ),
                        context: context,
                        builder: (BuildContext context) {
                          return GestureDetector(
                            onTap: () => FocusScope.of(context)
                                .requestFocus(FocusNode()),
                            child: Container(
                              height:
                                  ResponsiveUtils.screenHeight(context) * 0.52,
                              margin: const EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  const Text(
                                    "Easy Way To Top Up Your Wallet",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  const SizedBox(height: 30),
                                  TextField(
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    textInputAction: TextInputAction.done,
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      setState(() {
                                        _topUpAmount = int.tryParse(value) ?? 0;
                                      });
                                    },
                                    // controller: _balanceController,
                                    decoration: InputDecoration(
                                      labelText: "Enter Amount",
                                      prefix: const Text("₹"),
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 40),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        height: 43,
                                        width: 120,
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                              Colors.white,
                                            ),
                                            foregroundColor:
                                                MaterialStateProperty.all(
                                              Colors.blue,
                                            ),
                                            side: MaterialStateProperty.all(
                                              const BorderSide(
                                                color: Colors.blue,
                                                width: 2,
                                              ),
                                            ),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _topUpAmount = 0;
                                            });
                                            Navigator.pop(context);
                                          },
                                          child: const Text("Cancel"),
                                        ),
                                      ),
                                      RazorpayPayment(
                                        onPaymentSuccess: (paymentId) {
                                          FirebaseFirestore.instance
                                              .collection('users')
                                              .doc(FirebaseAuth
                                                  .instance.currentUser?.uid)
                                              .update({
                                            'walletBalance':
                                                FieldValue.increment(
                                                    _topUpAmount)
                                          });
                                          Navigator.pushNamedAndRemoveUntil(
                                              context,
                                              '/wallet',
                                              (route) => false);
                                        },
                                        amount: _topUpAmount,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  child: const Text(
                    "Add Money",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ));
  }
}
