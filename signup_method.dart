import 'package:flutter/material.dart';
import 'package:joltconnection/screens/signup/signup_with_email.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpMethodScreen extends StatefulWidget {
  final dynamic deviceid;
  const SignUpMethodScreen({this.deviceid,super.key});

  @override
  State<SignUpMethodScreen> createState() => _SignUpMethodScreenState();
}

class _SignUpMethodScreenState extends State<SignUpMethodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/background.png"), fit: BoxFit.cover),
        ),
        child: Padding(
            padding:
                const EdgeInsets.only(right: 30, left: 30, top: 50, bottom: 20),
            child: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            child: Align(
                              alignment: Alignment.center,
                              child: Image(
                                image: const AssetImage('assets/mainlogo.png'),
                                fit: BoxFit.contain,
                                height:
                                    MediaQuery.of(context).size.height * 0.22,
                                width: MediaQuery.of(context).size.width,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 20,
                          ),
                          Text(
                            "Welcome to Jolt Connection",
                            style: GoogleFonts.inter(
                              textStyle: Theme.of(context).textTheme.headlineLarge,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 20,
                          ),
                          Text(
                            "In times of crisis, stay connected with our emergency communication app. Send alerts and stay informed, all with the touch of a button.",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                               textStyle: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        ]),
                  ),
                ),
                Column(
                  children: [
                    const GoogleFacebookLogin(
                      img: "assets/googlelogin.png",
                      text: "Continue with Google",
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 30,
                    ),
                    const GoogleFacebookLogin(
                      img: "assets/facebooklogin.png",
                      text: "Continue with Facebook",
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => SignupWithEmail(deviceid: widget.deviceid,)));
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.transparent),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: const BorderSide(
                                          color: Colors.white, width: 3))),
                          minimumSize: MaterialStateProperty.all(Size(
                              MediaQuery.of(context).size.width,
                              MediaQuery.of(context).size.height * 0.06))),
                      child: Row(
                        children: [
                          Icon(
                            Icons.email_outlined,
                            color: Colors.white,
                            size: MediaQuery.of(context).size.width / 13,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          Text(
                            "Continue with Email",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.040,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}

class GoogleFacebookLogin extends StatelessWidget {
  final String text;
  final String img;

  const GoogleFacebookLogin({
    required this.text,
    required this.img,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          )),
          minimumSize: MaterialStateProperty.all(Size(
              MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height * 0.06))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              color: Colors.white,
              child: ImageIcon(
                AssetImage(img),
                size: MediaQuery.of(context).size.width / 14,
                color: Colors.black,
              )),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.07,
          ),
          Text(
            text,
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: MediaQuery.of(context).size.width * 0.040,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
