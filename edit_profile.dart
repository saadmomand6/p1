import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:joltconnection/screens/profile/profile.dart';
import '../../components/button.dart';
import '../../components/inputfield.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _cname = TextEditingController();
  final _cnumber = TextEditingController();
  final _cemail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "Edit Profile",
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
                  right: 30, left: 30, top: 30, bottom: 20),
              child: Column(children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                      Column(
                        children: [
                          Hero(
                            tag: 'pic',
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Container(
                                 decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: const Color.fromARGB(
                                                  255, 105, 2, 153),
                                              width: 5)),
                                  child: Container(
                                    decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: Colors.black,
                                              width: 5)),
                                    child: const CircleAvatar(
                                          backgroundImage:
                                              AssetImage("assets/man.jpg"),
                                          radius: 50,
                                        ),
                                  ),
                                ),
                                Positioned.fill(
                                  top: 80,
                                      bottom: 10,
                                      right: 15,
                                      left: 15,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width* 0.2,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            color: Colors.black54,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(70),
                                              bottomRight: Radius.circular(70),
                                              ),
                                        ),
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Image(
                                          image: const AssetImage(
                                              "assets/pictureprofile.png"),
                                          height: MediaQuery.of(context).size.height *
                                              0.025,
                                        )),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.050,
                      ),
                      InputField(
                        hinttext: "Name",
                        text: _cname,
                        isObscureText: false,
                        eye: null,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      InputField(
                        hinttext: "(269)-748-9882",
                        text: _cnumber,
                        isObscureText: false,
                        eye: null,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      InputField(
                        hinttext: "John_william@gmail.com",
                        text: _cemail,
                        isObscureText: false,
                        eye: null,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.13,
                      ),
                      Mainbutton(
                        buttontext: "Save",
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const ProfileScreen()));
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.11,
                      ),
                    ]))
              ])),
        ),
      ),
    );
  }
}
