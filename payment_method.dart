import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:joltconnection/screens/subscription/payment_details.dart';
import 'components/option_paymentmethod.dart';

class PaymentMetodScreen extends StatefulWidget {
  const PaymentMetodScreen({super.key});

  @override
  State<PaymentMetodScreen> createState() => _PaymentMetodScreenState();
}

class _PaymentMetodScreenState extends State<PaymentMetodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "Payment Method",
          style: GoogleFonts.inter(
            textStyle: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.normal,
                fontSize: MediaQuery.of(context).size.width * 0.065,
                fontWeight: FontWeight.w600),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/background.png"), fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(right: 30, left: 30, top: 50, bottom: 20),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.09,
                    ),
                    Text("Select your payment method.",
                        style: GoogleFonts.inter(
                          textStyle: Theme.of(context).textTheme.headlineLarge,
                        )),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.13,
                    ),
                    Text(
                      "Choose from below:",
                      style: GoogleFonts.inter(
                       textStyle: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.045,
                    ),
                    OptionPaymentMethod(
                      methodimagelink: "assets/paypal.png",
                      imgsize: MediaQuery.of(context).size.height * 0.030,
                      methodname: "Paypal",
                      ontap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const PaymentDetailsScreen()));
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    OptionPaymentMethod(
                      methodimagelink: "assets/cardpayment.png",
                       imgsize: MediaQuery.of(context).size.height * 0.025,
                      methodname: "Card",
                      ontap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const PaymentDetailsScreen()));
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    OptionPaymentMethod(
                      methodimagelink: "assets/applepay.png",
                       imgsize: MediaQuery.of(context).size.height * 0.030,
                      methodname: "Apple pay",
                      ontap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const PaymentDetailsScreen()));
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    OptionPaymentMethod(
                      methodimagelink: "assets/googlepay.png",
                       imgsize: MediaQuery.of(context).size.height * 0.026,
                      methodname: "Google pay",
                      ontap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const PaymentDetailsScreen()));
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
