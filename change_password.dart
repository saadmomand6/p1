import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../components/button.dart';
import '../../components/inputfield.dart';
import 'login_edit.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _coldpassword = TextEditingController();
  final _cnewpassword = TextEditingController();
  final _cconfirmpassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "Change Password",
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
                  right: 30, left: 30, top: 10, bottom: 20),
              child: Column(children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.12,
                ),
                Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Old password",
                            style: GoogleFonts.inter(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                            )),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      InputField(
                        hinttext: "",
                        text: _coldpassword,
                        isObscureText: true,
                        eye: null,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("New Password",
                            style: GoogleFonts.inter(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                            )),
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
                        height: MediaQuery.of(context).size.height * 0.045,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Password must:",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.inter(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.015,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.info,
                                color: Color(0xff5E5E5E),
                              ),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.035,
                              ),
                              Text(
                                "Be at least 6 characters long",
                                textAlign: TextAlign.left,
                                style: GoogleFonts.inter(
                                    textStyle:
                                        Theme.of(context).textTheme.bodySmall),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.015,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.check_circle,
                                color: Color(0xffFFEEA8),
                              ),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.035,
                              ),
                              Text(
                                "Have at least one uppercase",
                                textAlign: TextAlign.left,
                                style: GoogleFonts.inter(
                                    textStyle:
                                        Theme.of(context).textTheme.bodySmall),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.015,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.check_circle,
                                color: Color(0xffFFEEA8),
                              ),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.035,
                              ),
                              Text(
                                "Have at least one lowercase",
                                textAlign: TextAlign.left,
                                style: GoogleFonts.inter(
                                    textStyle:
                                        Theme.of(context).textTheme.bodySmall),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.015,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.info,
                                color: Color(0xff5E5E5E),
                              ),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.035,
                              ),
                              Text(
                                "Have at least one number",
                                textAlign: TextAlign.left,
                                style: GoogleFonts.inter(
                                    textStyle:
                                        Theme.of(context).textTheme.bodySmall),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.025,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Confirm Password",
                                style: GoogleFonts.inter(
                                  textStyle:
                                      Theme.of(context).textTheme.labelLarge,
                                )),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.025,
                          ),
                          InputField(
                            hinttext: "",
                            text: _cconfirmpassword,
                            isObscureText: true,
                            eye: null,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.035,
                      ),
                      Mainbutton(
                        buttontext: "Reset Password",
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const LoginEditScreen()));
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                    ]))
              ])),
        ),
      ),
    );
  }
}
