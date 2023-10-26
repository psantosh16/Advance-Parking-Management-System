import 'package:apms_project/Controller/provider/pickdate.dart';
import 'package:apms_project/View/Screens/Payment/paymentGateway.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    Provider.of<datepickprovider>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text("Wallet"),
        ),
        body:  Consumer<datepickprovider>(builder: (context, value, child) {
          return  Center(child: PaymentGateway(amount: value.amount,));
        }));
  }
}
