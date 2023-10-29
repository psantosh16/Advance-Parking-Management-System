import 'package:apms_project/View/auth/showmessage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorpayPayment extends StatefulWidget {
  final Function(String) onPaymentSuccess;
  final int amount;

  const RazorpayPayment({super.key, required this.onPaymentSuccess, required this.amount});

  @override
  // ignore: library_private_types_in_public_api
  _RazorpayPaymentState createState() => _RazorpayPaymentState();
}

class _RazorpayPaymentState extends State<RazorpayPayment> {
  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
   showmessage( context, "SUCCESS: ₹${widget.amount.toString()}");
    widget.onPaymentSuccess(response.paymentId!);
  }
  
  void _handlePaymentError(PaymentFailureResponse response) {
    showmessage(context, "ERROR: ${response.code.toString()} - ${response.message}");
  }
  void _openRazorpay() {
    var options = {
      'key': dotenv.env['RAZORPAY_KEY_ID'],
      'amount': widget.amount * 100, 
      'name': 'Parkiza',
      'description': 'Parkiza Wallet Topup',
      'prefill': {
        'contact': '1234567890',
        'email': 'gojo@gmail.com',
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          width: 120,
          height: 43,
          child: ElevatedButton(
            onPressed: _openRazorpay,
            child: const Text('Pay'),
          ),
        ),
      ],
    );
  }
}
