import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:joltconnection/screens/setting/templates.dart';
import '../../components/inputfield.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _cjoltlimit = TextEditingController();
  final _cjoltpermonth = TextEditingController();
  bool switchvalue = false;
  bool checkboxvalue = false;
  void toggleSwitch(bool value) {
    if (switchvalue == false) {
      setState(() {
        switchvalue = true;
      });
    } else {
      setState(() {
        switchvalue = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "Settings",
          style: GoogleFonts.inter(
            textStyle: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.normal,
                fontSize: MediaQuery.of(context).size.width * 0.065,
                fontWeight: FontWeight.w600),
          ),
        )
            .animate()
            .fadeIn(duration: 500.ms)
            .scale(delay: 500.ms)
            .move(delay: 300.ms, duration: 600.ms),
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
                  "THEME",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.inter(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.035,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Image(
                //           image: const AssetImage("assets/darkmode.png"),
                //           height: MediaQuery.of(context).size.height * 0.040,
                //         ),
                //         SizedBox(
                //           width: MediaQuery.of(context).size.width * 0.06,
                //         ),
                //         Text(
                //           "Dark Mode",
                //           style: GoogleFonts.inter(
                //             color: Colors.white,
                //             textStyle:
                //                 Theme.of(context).textTheme.headlineMedium,
                //           ),
                //         ),
                //       ],
                //     ),
                //     Expanded(
                //       child: Align(
                //         alignment: Alignment.centerRight,
                //         child: Switch(
                //           value: switchvalue,
                //           onChanged: toggleSwitch,
                //           activeColor: const Color.fromARGB(255, 197, 155, 206),
                //           activeTrackColor: const Color(0xff5E5E5E),
                //           inactiveThumbColor:
                //               const Color.fromARGB(255, 113, 77, 121),
                //           inactiveTrackColor: const Color(0xff5E5E5E),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // const Divider(
                //   height: 5,
                //   thickness: 3,
                //   color: Color(0xff5E5E5E),
                // ),
                // SizedBox(
                //   height: MediaQuery.of(context).size.height * 0.02,
                // ),
                Text(
                  "JOLTS",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.inter(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Text(
                  "Jolts limits per user per day",
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    textStyle: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Text(
                  "Put a restriction on the number of messages a user can send per day.",
                  style: GoogleFonts.inter(
                    textStyle: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                InputField(
                    text: _cjoltlimit,
                    hinttext: "Insert a number",
                    isObscureText: false),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Text(
                  "Default Jolts allowed in a month",
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    textStyle: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Text(
                  "If the default setting is selected, the number of messages allowed for every user in a month will be pre-determined..",
                  style: GoogleFonts.inter(
                    textStyle: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                InputField(
                    text: _cjoltpermonth,
                    hinttext: "Insert a number",
                    isObscureText: false),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                const Divider(
                  height: 1,
                  thickness: 3,
                  color: Color(0xff5E5E5E),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Link contact list",
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        textStyle: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                    Checkbox(
                      checkColor: Colors.white,
                      activeColor: const Color.fromARGB(255, 197, 155, 206),
                      value: checkboxvalue,
                      onChanged: (bool? value) {
                        setState(() {
                          checkboxvalue = value!;
                        });
                      },
                    ),
                  ],
                ),
                const Divider(
                  height: 1,
                  thickness: 3,
                  color: Color(0xff5E5E5E),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            transitionDuration: const Duration(seconds: 3),
                            transitionsBuilder:
                                (context, animation, animationTime, child) {
                              animation = CurvedAnimation(
                                    parent: animation,
                                    curve: Curves.elasticInOut);
                              return ScaleTransition(
                                alignment: Alignment.center,
                                scale: animation,
                                child: child,
                              );
                            },
                            pageBuilder: (context, animation, animationTime) {
                              return const TemlplatesScreen();
                            }));
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (_) => const TemlplatesScreen()));
                  },
                  child: Text('DEFAULT MESSAGES',
                      style: GoogleFonts.inter(
                        decoration: TextDecoration.underline,
                        textStyle: Theme.of(context).textTheme.headlineMedium,
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
