import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../components/button.dart';
import '../../components/inputfield.dart';
import '../../components/toast.dart';
import '../../components/validations_functions.dart';
import '../../view_models/auth_view_model.dart';
import 'package:pinput/pinput.dart';

class NewPassword extends StatefulWidget {
  final String email;
  const NewPassword({required this.email, super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final TextEditingController _pincontroller = TextEditingController();
  final _cnewpassword = TextEditingController();
  final _ccreatepassword = TextEditingController();
  final defaultPinTheme = PinTheme(
    width: 40,
    height: 45,
    textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(255, 255, 255, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: const Color.fromRGBO(142, 87, 230, 1)),
      borderRadius: BorderRadius.circular(10),
    ),
  );

  final focusedPinTheme = PinTheme(
    width: 40,
    height: 45,
    textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(255, 0, 0, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: const Color.fromRGBO(255, 251, 0, 1)),
      borderRadius: BorderRadius.circular(8),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final newpasswordauthviewmodel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "New Password",
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
                  right: 30, left: 30, top: 30, bottom: 20),
              child: Column(children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          "Please enter the 4 digit code sent to the mentioned email.",
                          style: GoogleFonts.inter(
                            textStyle: Theme.of(context).textTheme.bodySmall,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.050,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Pinput(
                              length: 6,
                              controller: _pincontroller,
                              defaultPinTheme: defaultPinTheme,
                              focusedPinTheme: focusedPinTheme,
                              pinputAutovalidateMode:
                                  PinputAutovalidateMode.onSubmit,
                              showCursor: true,
                              onCompleted: (pin) => print(pin),
                            )
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text('RESEND CODE',
                            style: GoogleFonts.inter(
                              decoration: TextDecoration.underline,
                              textStyle:
                                  Theme.of(context).textTheme.headlineMedium,
                            )),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.020,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          "Your new password must be different from previously used password.",
                          style: GoogleFonts.inter(
                            textStyle: Theme.of(context).textTheme.bodySmall,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.050,
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
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Create Password",
                            style: GoogleFonts.inter(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                            )),
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
                        height: MediaQuery.of(context).size.height * 0.10,
                      ),
                      Mainbutton(
                        buttontext: "Save",
                        onPressed: () {
                          if (_cnewpassword.text.isEmpty) {
                            alertDialog("Please Enter Your New Password",
                                const Color(0xffE9D502), Colors.black);
                          } else if (_ccreatepassword.text.isEmpty) {
                            alertDialog("Please Enter Your Create Password",
                                const Color(0xffE9D502), Colors.black);
                          } else if (!validatepassword(_cnewpassword.text)) {
                            alertDialog(
                                "New Password Should Contain eight characters, at least one letter and one number",
                                const Color.fromARGB(255, 230, 9, 9),
                                Colors.white);
                          } else if (!validatepassword(_ccreatepassword.text)) {
                            alertDialog(
                                "Create Password Sould Contain eight characters, at least one letter and one number",
                                const Color.fromARGB(255, 230, 9, 9),
                                Colors.white);
                          } else if (_ccreatepassword.text !=
                              _cnewpassword.text) {
                            alertDialog(
                                "Password Mismatched",
                                const Color.fromARGB(255, 230, 9, 9),
                                Colors.white);
                          } else {
                            Map<String, dynamic> data = {
                              "email": widget.email.toString(),
                              "password": _cnewpassword.text,
                              "password_confirmation": _ccreatepassword.text,
                              "code": _pincontroller.text
                            };
                            newpasswordauthviewmodel.resetPasswordApiModel(data, context);
                          }
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.045,
                      ),
                    ]))
              ])),
        ),
      ),
    );
  }
}
