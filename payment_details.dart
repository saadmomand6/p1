import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:joltconnection/screens/subscription/payment_successful.dart';
import '../../components/button.dart';
import '../../components/inputfield.dart';

class PaymentDetailsScreen extends StatefulWidget {
  const PaymentDetailsScreen({super.key});

  @override
  State<PaymentDetailsScreen> createState() => _PaymentDetailsScreenState();
}

class _PaymentDetailsScreenState extends State<PaymentDetailsScreen> {
  final _ccardname = TextEditingController();
  final _ccardnumber = TextEditingController();
  bool isSwitched = false;
  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
      });
    } else {
      setState(() {
        isSwitched = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "Payment Details",
          style: GoogleFonts.inter(
            textStyle: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.normal,
                fontSize: MediaQuery.of(context).size.width * 0.065,
                fontWeight: FontWeight.w600),
          ),
        ),
        elevation: 0,
        backgroundColor: const Color.fromARGB(192, 0, 0, 0),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.09,
                ),
                Text(
                  "Subscription Details",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.inter(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.035,
                ),
                const BillRow(
                  billitem: 'Subscription',
                  value: 'Premium Package',
                ),
                const BillRow(
                  billitem: 'Amount',
                  value: '€18',
                ),
                const BillRow(
                  billitem: 'VAT (10%)',
                  value: '€1.8',
                ),
                const BillRow(
                  billitem: 'Duration',
                  value: '1 Month',
                ),
                const Divider(
                  height: 5,
                  thickness: 3,
                  color: Color(0xff5E5E5E),
                ),
                const BillRow(
                  billitem: 'Total',
                  value: '€19.8',
                ),
                const Divider(
                  height: 5,
                  thickness: 3,
                  color: Color(0xff5E5E5E),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                Text(
                  "Card Details",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.inter(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                InputField(
                    text: _ccardname,
                    hinttext: "Paula Richards",
                    isObscureText: false),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                InputField(
                    text: _ccardnumber,
                    hinttext: "5412 7512 3456 7890",
                    isObscureText: false),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        cursorColor: Colors.red,
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.042,
                              fontWeight: FontWeight.w600),
                        ),
                        decoration: InputDecoration(
                          hintText: "CVV",
                          hintStyle: TextStyle(
                              fontSize: MediaQuery.of(context).size.width / 24),
                          filled: true,
                          fillColor: Colors.transparent,
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                width: 1,
                              )),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              width: 2,
                              color: Colors.white,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  width: 1, color: Colors.white)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        cursorColor: Colors.red,
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.042,
                              fontWeight: FontWeight.w600),
                        ),
                        decoration: InputDecoration(
                          hintText: "Expiry Date",
                          hintStyle: TextStyle(
                              fontSize: MediaQuery.of(context).size.width / 24),
                          filled: true,
                          fillColor: Colors.transparent,
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                width: 1,
                              )),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              width: 2,
                              color: Colors.white,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  width: 1, color: Colors.white)),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Save your card information",
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        textStyle: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                    Switch(
                      value: isSwitched,
                      onChanged: toggleSwitch,
                      activeColor: const Color.fromARGB(255, 197, 155, 206),
                      activeTrackColor: const Color(0xff5E5E5E),
                      inactiveThumbColor:
                          const Color.fromARGB(255, 113, 77, 121),
                      inactiveTrackColor: const Color(0xff5E5E5E),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Mainbutton(
                  buttontext: "Pay",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const PaymentSuccessfulScreen()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BillRow extends StatelessWidget {
  final String billitem;
  final String value;
  const BillRow({
    required this.billitem,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.030,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(billitem,
              style: GoogleFonts.inter(
                textStyle: Theme.of(context).textTheme.bodySmall,
              )),
          Text(value,
              style: GoogleFonts.inter(
                textStyle: Theme.of(context).textTheme.bodySmall,
              )),
        ],
      ),
    );
  }
}
