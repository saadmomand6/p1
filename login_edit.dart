import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../components/button.dart';
import '../../components/inputfield.dart';
import '../../components/navbar.dart';

class LoginEditScreen extends StatefulWidget {
  const LoginEditScreen({super.key});

  @override
  State<LoginEditScreen> createState() => _LoginEditScreenState();
}

class _LoginEditScreenState extends State<LoginEditScreen> {
  final _cnewpassword = TextEditingController();
  final _ccreatepassword = TextEditingController();
  bool checkboxvalue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "Log in",
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
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background.png"), fit: BoxFit.cover),
          ),
          child: Padding(
              padding: const EdgeInsets.only(
                  right: 30, left: 30, top: 30, bottom: 60),
              child: Column(children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.18,
                ),
                Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                      Container(
                        decoration: const BoxDecoration(
                            color: Color(0xffFFEEA8),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 15),
                          child: Text(
                            "Done! You can login now..",
                            style: GoogleFonts.inter(
                                color: Colors.black,
                                textStyle:
                                    Theme.of(context).textTheme.bodySmall),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.12,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Email Address",
                            style: GoogleFonts.inter(
                                textStyle:
                                    Theme.of(context).textTheme.labelLarge)),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      InputField(
                        hinttext: "",
                        text: _cnewpassword,
                        isObscureText: true,
                        eye: null,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Password",
                            style: GoogleFonts.inter(
                                textStyle:
                                    Theme.of(context).textTheme.labelLarge)),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      InputField(
                        hinttext: "",
                        text: _ccreatepassword,
                        isObscureText: true,
                        eye: null,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.015,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            checkColor: Colors.white,
                            activeColor:
                                const Color.fromARGB(255, 197, 155, 206),
                            value: checkboxvalue,
                            onChanged: (bool? value) {
                              setState(() {
                                checkboxvalue = value!;
                              });
                            },
                          ),
                          Text(
                            "Remember Me",
                            style: GoogleFonts.inter(
                                textStyle:
                                    Theme.of(context).textTheme.bodySmall),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      Mainbutton(
                        buttontext: "Log in",
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true).push(
                              MaterialPageRoute(
                                  builder: (context) => const NavBar()));
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.055,
                      ),
                    ]))
              ])),
        ),
      ),
    );
  }
}
