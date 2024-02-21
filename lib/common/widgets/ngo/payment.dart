import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:solution_challenge/utils/constants/image_strings.dart';

class RazorPayPage extends StatefulWidget{
  const RazorPayPage({super.key});

  @override
  RazorPayPageState createState() => RazorPayPageState();
}

class RazorPayPageState extends State<RazorPayPage>{
  late Razorpay _razorPay;

  @override
  void initState(){
    super.initState();
    _razorPay = Razorpay();
    _razorPay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorPay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorPay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose(){
    _razorPay.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Razorpay Payment'),
      ),
      body: Center(
        child: customPaymentButton(
          buttonText: 'Pay with razorpay',
          onTap: (){
            openCheckout(amount: 250, itemName: 'NGO');
          }),
      ),
    );
  }

  void openCheckout({required int amount, required String itemName}) async {
    var options = {
      'key': 'rzp_test_e56tcYSQvixMhF',
      'amount': amount * 100,
      'name': itemName,
      'method': {'netbanking': '1', 'card': '1', 'upi': '1', 'wallet': '1'},
      'description': 'To NGOs',
      'send_sms_hash': true,
      'prefill': {'contact': '8488903211', 'email': 'test@gmail.com'},
      'external': {
        'wallets': ['paytm', 'phonepe']
      }
    };

    try {
      _razorPay.open(options);
    } catch (e){
      print("Error occurred while opening options: $e");
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response){
    print("Success Response: $response");
    Fluttertoast.showToast(msg: 'SUCCESS: ${response.paymentId}', toastLength: Toast.LENGTH_SHORT);
  }

  void _handlePaymentError(PaymentFailureResponse response){
    print("Error Response: $response");
    Fluttertoast.showToast(msg: 'ERROR: ${response.code} - ${response.message!}', toastLength: Toast.LENGTH_SHORT);
  }

  void _handleExternalWallet(ExternalWalletResponse response){
    print("External SDK Response: $response");
    Fluttertoast.showToast(msg: 'EXTERNAL WALLET: ${response.walletName!}', toastLength: Toast.LENGTH_SHORT);
  }


  Widget customPaymentButton({
    required String buttonText,
    required VoidCallback onTap,
  }){
    return ElevatedButton(
      onPressed: onTap,
      child: Text(buttonText),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 2,
      ),
    );
  }
}

