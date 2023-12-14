import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../components/button.dart';
import '../../components/inputfield.dart';
import '../../components/toast.dart';
import '../../components/validations_functions.dart';
import '../../view_models/auth_view_model.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _cforgotemail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final forgotauthviewmodel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "Forgot Password",
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
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background.png"), fit: BoxFit.cover),
          ),
          child: Padding(
              padding: const EdgeInsets.only(
                  right: 30, left: 30, top: 50, bottom: 40),
              child: Column(children: [
                Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.15,
                      ),
                      Container(
                          height: MediaQuery.of(context).size.height / 5,
                          width: MediaQuery.of(context).size.width / 2.5,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(125, 71, 70, 70),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(35.0),
                            child: Image(
                              image:
                                  const AssetImage('assets/forgotpassword.png'),
                              height:
                                  MediaQuery.of(context).size.height * 0.025,
                              width: MediaQuery.of(context).size.width * 0.025,
                            ),
                          )),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.035,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          "Please enter your email address to receive a verification code.",
                          style: GoogleFonts.inter(
                            textStyle: Theme.of(context).textTheme.bodySmall,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.055,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Email Address",
                            style: GoogleFonts.inter(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                            )),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      InputField(
                        hinttext: "John_william@gmail.com",
                        text: _cforgotemail,
                        isObscureText: false,
                        eye: null,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.20,
                      ),
                      Mainbutton(
                        buttontext: "Send",
                        onPressed: () {
                          if (_cforgotemail.text.isEmpty) {
                            alertDialog("Please Enter Your Email",
                                const Color(0xffE9D502), Colors.black);
                          } else if (!validateemail(_cforgotemail.text)) {
                            alertDialog(
                                "Email Formate Incorrect",
                                const Color.fromARGB(255, 230, 9, 9),
                                Colors.white);
                          } else {
                            Map<String, dynamic> data = {
                              "email": _cforgotemail.text,
                            };
                            forgotauthviewmodel.forgotPasswordApiModel(_cforgotemail.text, data, context);
                          }
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
