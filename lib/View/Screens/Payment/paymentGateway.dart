import 'package:apms_project/View/auth/showmessage.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class PaymentGateway extends StatefulWidget {
  const PaymentGateway({super.key});

  @override
  State<PaymentGateway> createState() => _PaymentGatewayState();
}

class _PaymentGatewayState extends State<PaymentGateway> {
  late Razorpay _razorpay;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    showmessage(context, "SUCCESS: ${response.paymentId!}");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment succeeds
    showmessage(context, "ERROR: ${response.code} - ${response.message!}");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
    showmessage(context, "EXTERNAL_WALLET: ${response.walletName!}");
  }

  // fake upi id => rajat@ybl

  void makePayment() async {
 
    final _keyId = dotenv.env['RAZORPAY_KEY_ID'];
    var options = {
      'key': _keyId,
      'amount': 20000, // RS 200
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
    // TODO: implement dispose
    super.dispose();
    _razorpay.clear();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          makePayment();
        },
        child: Text("Pay"));
  }
}
