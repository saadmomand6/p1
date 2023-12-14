import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:joltconnection/screens/signup/signup_with_email.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import '../../components/button.dart';
import '../../view_models/auth_view_model.dart';

class VerifyyYourEmail extends StatefulWidget {
  final dynamic token;
  const VerifyyYourEmail({required this.token, super.key});

  @override
  State<VerifyyYourEmail> createState() => _VerifyyYourEmailState();
}

class _VerifyyYourEmailState extends State<VerifyyYourEmail> {
  final TextEditingController _pincontroller = TextEditingController();
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
    final verifyauthviewmodel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/background3.png"), fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 7,
              child: Center(
                child: Container(
                  color: Colors.transparent,
                  height: 200,
                  width: 200,
                  child: Center(
                    child: Image(
                      image:
                          const AssetImage('assets/flashiconnotification.png'),
                      height: MediaQuery.of(context).size.height / 6,
                      width: MediaQuery.of(context).size.width / 6,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: Container(
                padding: const EdgeInsets.all(18.0),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(188, 39, 36, 36),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 15,
                      ),
                      Text("Verify your email",
                          style: GoogleFonts.inter(
                            textStyle:
                                Theme.of(context).textTheme.headlineLarge,
                          )),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 30,
                      ),
                      Text(
                          "Kindly provide the 6-digit code that was sent to the email address you previously provided for verification purposes.",
                          style: GoogleFonts.inter(
                            textStyle: Theme.of(context).textTheme.bodySmall,
                          )),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 30,
                      ),
                      Row(
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
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
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
                        height: MediaQuery.of(context).size.height * 0.050,
                      ),
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Mainbutton(
                              buttontext: "Confirm",
                              onPressed: () {
                                 Map<String, dynamic> data = {
                                       "type": "email",
                                       "code": _pincontroller.text.toString()
                                    };
                                    verifyauthviewmodel.verifyUserApiModel(data, context);
                              },
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.width / 70,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const SignupWithEmail()));
                            },
                            child: Text('CHANGE EMAIL',
                                style: GoogleFonts.inter(
                                  decoration: TextDecoration.underline,
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                )),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
