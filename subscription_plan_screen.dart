import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:joltconnection/screens/subscription/payment_method.dart';
import '../../components/subscription_box.dart';

enum Plans{starter,basic,standard,premium}
const inactivecardcolor = Color.fromARGB(255, 117, 112, 119);
const activecardcolor= Color.fromARGB(255, 197, 20, 20);

class SubscriptionPlanScreen extends StatefulWidget {
  final String pagename;
  const SubscriptionPlanScreen({required this.pagename,super.key});

  @override
  State<SubscriptionPlanScreen> createState() => _SubscriptionPlanScreenState();
}

class _SubscriptionPlanScreenState extends State<SubscriptionPlanScreen> {
  Plans? selectedplan;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          widget.pagename,
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
                const EdgeInsets.only(right: 30, left: 30, top: 30, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedplan = Plans.starter;
                      });
                       Navigator.push(
            context, MaterialPageRoute(builder: (_) => const PaymentMetodScreen()));
                    },
                     child: SubscriptionBox(
                                     packagename: "Starter",
                                     description:  "Recieve jolts and no other type of service",
                                     price:  "€5",
                                     timeperiod: "Free Subscription",
                     color: selectedplan==Plans.starter ? activecardcolor: inactivecardcolor,
                                     ),
                   ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                    selectedplan = Plans.basic;
                    });
                    Navigator.push(
            context, MaterialPageRoute(builder: (_) => const PaymentMetodScreen()));
                  },
                  child: SubscriptionBox(
                    packagename: "Basic",
                    description:
                        "By subscribing, user will be able to send jolts to a single designated user.",
                    price: "€5",
                    timeperiod: "/Month",
                    color: selectedplan==Plans.basic ? activecardcolor: inactivecardcolor,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                 GestureDetector(
                  onTap: (){
                      setState(() {
                        selectedplan = Plans.standard;
                      });
                      Navigator.push(
            context, MaterialPageRoute(builder: (_) => const PaymentMetodScreen()));
                    },
                   child: SubscriptionBox(
                    packagename: "Standard",
                    description:
                        "By subscribing, users will be able to send messages to up to three designated users.",
                    price: "€10",
                    timeperiod: "/Month",
                    color: selectedplan==Plans.standard ? activecardcolor: inactivecardcolor,
                                 ),
                 ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                 GestureDetector(
                  onTap: (){
                      setState(() {
                        selectedplan = Plans.premium;
                      });
                      Navigator.push(
            context, MaterialPageRoute(builder: (_) => const PaymentMetodScreen()));
                  },
                   child: SubscriptionBox(
                    packagename: "Premium",
                    description:
                        "By subscribing, users will be able to send jolts to unlimited users.",
                    price: "€18",
                    timeperiod: "/Month",
                    color: selectedplan==Plans.premium ? activecardcolor: inactivecardcolor,
                                 ),
                 ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
