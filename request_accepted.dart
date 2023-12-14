import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../components/alert_screen.dart';
import '../../components/button.dart';
import '../../components/inputfield.dart';
import '../../components/navbar.dart';
import '../../view_models/jolt_request_status_view_model.dart';

class RequestAcceptedScreen extends StatefulWidget {
  final String? requestedId;
  const RequestAcceptedScreen({this.requestedId,super.key});

  @override
  State<RequestAcceptedScreen> createState() => _RequestAcceptedScreenState();
}

class _RequestAcceptedScreenState extends State<RequestAcceptedScreen> {
  final _cnumber = TextEditingController();
  bool checkboxvalue = false;

  @override
  Widget build(BuildContext context) {
    final joltRequestStatusViewModel =
        Provider.of<JoltRequestStatusViewModel>(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "Request Accepted",
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
                  right: 30, left: 30, top: 130, bottom: 60),
              child: Column(children: [
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 0, right: 20),
                  leading: const CircleAvatar(
                    backgroundImage: AssetImage(
                      "assets/man2.jpeg",
                    ),
                    radius: 30,
                    backgroundColor: Colors.grey,
                  ),
                  title: Text(
                    "The request from Shawn J has been accepted.",
                    style: GoogleFonts.inter(
                        textStyle: Theme.of(context).textTheme.bodySmall),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Jolt message allowed",
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      textStyle: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Text(
                  "Enter a number below to set a limit on the number of messages this user can send you.",
                  textAlign: TextAlign.start,
                  style: GoogleFonts.inter(
                      textStyle: Theme.of(context).textTheme.bodySmall),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                InputField(
                    text: _cnumber,
                    hinttext: "Insert a number",
                    isObscureText: true),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.32,
                ),
                Mainbutton(
                    buttontext: "Save",
                    onPressed: () {
                      Map<String, dynamic> data = {
                        "requestId": widget.requestedId,
                        "status": 9,
                        "numberOfJolts": _cnumber.toString()
                      };
                      joltRequestStatusViewModel.joltRequestStatusApiModel(
                          data, context);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => AlertScreen(
                                    backgrounimg: "assets/background.png",
                                    backcolor: Colors.grey.withOpacity(0.3),
                                    iconimg: "assets/notification3.png",
                                    iconsize:
                                        MediaQuery.of(context).size.height *
                                            0.2,
                                    title: "Nothing here!",
                                    description:
                                        "There are currently no new notifications for view.",
                                    buttontext: "Go to Home",
                                    ontap: () {
                                      Navigator.of(context, rootNavigator: true)
                                          .push(MaterialPageRoute(
                                              builder: (context) =>
                                                  const NavBar()));
                                    },
                                  )));
                    }),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
              ])),
        ),
      ),
    );
  }
}
