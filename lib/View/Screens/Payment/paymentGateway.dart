import 'package:apms_project/Controller/provider/pickdate.dart';
import 'package:apms_project/Utils/color_theme.dart';
import 'package:apms_project/View/Screens/Payment/after_payment.dart';
import 'package:apms_project/View/auth/showmessage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class PaymentGateway extends StatefulWidget {
  final int amount;
  const PaymentGateway({required this.amount, super.key});
  @override
  State<PaymentGateway> createState() => _PaymentGatewayState();
}

class _PaymentGatewayState extends State<PaymentGateway> {
  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    try {
      showmessage(context, "SUCCESS: ${response.paymentId!}");
      afterPayment(context);
      Navigator.pushReplacementNamed(context, "/screen");
    } catch (e) {
      showmessage(context, "ERROR: ${e.toString()}");
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment succeeds
    showmessage(context, "ERROR: ${response.code} - ${response.message!}");
    Navigator.pushReplacementNamed(context, "/screen");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
    showmessage(context, "EXTERNAL_WALLET: ${response.walletName!}");
    Navigator.pushReplacementNamed(context, "/screen");
  }

  // fake upi id => rajat@ybl
  void makePayment() async {
    final keyId = dotenv.env['RAZORPAY_KEY_ID'];
    var options = {
      'key': keyId,
      'amount': widget.amount * 100,
      'name': 'Parkiza',
      'description': 'Online Parking slot booking',
      'prefill': {'contact': '6060606062', 'email': 'gojo@gmail.com'},
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  @override
  Widget build(BuildContext context) {
    final dateprovider = Provider.of<datepickprovider>(context, listen: false);
    return SizedBox(
      width: 150,
      height: 43,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(6))),
            backgroundColor: const Color.fromARGB(255, 199, 255, 41),
            foregroundColor: ColorTheme.blackTheme,
          ),
          onPressed: () {
            if (dateprovider.formattedDate == "Select Date") {
              showmessage(context, "Please select date");
            } else if (dateprovider.starttime.toString() == "Start" ||
                dateprovider.endtime.toString() == "End") {
              showmessage(context, "Please select time");
            } else {
              makePayment();
            }
          },
          child: const Text("Pay")),
    );
  }
}
