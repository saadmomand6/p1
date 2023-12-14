import 'dart:io';
import 'package:flutter/material.dart';
import 'package:joltconnection/components/toast.dart';
import 'package:joltconnection/screens/signup/signup_method.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sound_mode/permission_handler.dart';
import '../components/button.dart';
import '../components/firebase_notification_services.dart';
import '../components/inputfield.dart';
import '../components/validations_functions.dart';
import '../view_models/auth_view_model.dart';
import 'forgotpassword/forgotpassword_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _passwordVisible = true;
  final _cemail = TextEditingController();
  final _cpassword = TextEditingController();
  dynamic deviceid;

  FirebaseNotificationServices firebaseNotificationServices =
      FirebaseNotificationServices();
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      getdndpermission();
    }
    firebaseNotificationServices.requestNotificationPermission();
    firebaseNotificationServices.firebaseInit(context);
    firebaseNotificationServices.foregroundMessage();
    firebaseNotificationServices.setupInteractMessage(context);
    firebaseNotificationServices.getDeviceToken().then((value) {
      print("Device Token");
      print(value);
      setState(() {
        deviceid = value;
      });
    });
  }

  Future<bool?> getdndpermission() async {
    if (Platform.isAndroid) {
      var per = await PermissionHandler.permissionsGranted;
      if (!per!) {
        await PermissionHandler.openDoNotDisturbSetting();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final loginauthviewmodel = Provider.of<AuthViewModel>(context);
    firebaseNotificationServices.getDeviceToken();
    return WillPopScope(
      child: Scaffold(
        body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background.png"), fit: BoxFit.cover),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 30, left: 30, top: 50, bottom: 20),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Align(
                          alignment: Alignment.center,
                          child: Image(
                            image: const AssetImage('assets/mainlogo.png'),
                            fit: BoxFit.contain,
                            height: MediaQuery.of(context).size.height * 0.22,
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 20,
                      ),
                      Text("Log in",
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.025),
                          )),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 23,
                      ),
                      InputField(
                        hinttext: "Username / Email",
                        text: _cemail,
                        isObscureText: false,
                        eye: null,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 20,
                      ),
                      InputField(
                        hinttext: "Password",
                        text: _cpassword,
                        isObscureText: _passwordVisible,
                        eye: IconButton(
                          icon: Icon(
                            _passwordVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.white,
                            size: 17,
                          ),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const ForgetPassword()));
                            },
                            child: Text("Forgot password",
                                style: GoogleFonts.inter(
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                ))),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Mainbutton(
                          buttontext: "Log in",
                          onPressed: () {
                            if (_cemail.text.isEmpty) {
                              alertDialog("Please Enter Your Email",
                                  const Color(0xffE9D502), Colors.black);
                            } else if (_cpassword.text.isEmpty) {
                              alertDialog("Please Enter Your Password",
                                  const Color(0xffE9D502), Colors.black);
                            } else if (!validateemail(_cemail.text)) {
                              alertDialog(
                                  "Email Formate Incorrect",
                                  const Color.fromARGB(255, 230, 9, 9),
                                  Colors.white);
                            } else if (!validatepassword(_cpassword.text)) {
                              alertDialog(
                                  "Password Should Contain Eight Alphabets and a Number",
                                  const Color.fromARGB(255, 230, 9, 9),
                                  Colors.white);
                            } else {
                              Map<String, dynamic> data = {
                                "email": _cemail.text.toString(),
                                "password": _cpassword.text.toString(),
                                "deviceId": deviceid.toString()
                              };
                              print("recived id $deviceid");
                              loginauthviewmodel.loginApiModel(data, context);
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.010,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Don't have an account",
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                textStyle:
                                    Theme.of(context).textTheme.headlineMedium,
                              )),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => SignUpMethodScreen(
                                            deviceid: deviceid,
                                          )));
                            },
                            child: Text('SignUp',
                                style: GoogleFonts.inter(
                                  decoration: TextDecoration.underline,
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                )),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      onWillPop: () async {
        exit(0);
      },
    );
  }
}
