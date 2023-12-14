import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:joltconnection/view_models/user_view_model.dart';
import 'package:provider/provider.dart';
import '../../components/button.dart';
import '../login_screen.dart';
import '../subscription/subscription_plan_screen.dart';
import 'change_password.dart';
import 'edit_profile.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final userPreference = Provider.of<UserViewModel>(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "Profile",
          style: GoogleFonts.inter(
            textStyle: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.normal,
                fontSize: MediaQuery.of(context).size.width * 0.065,
                fontWeight: FontWeight.w600),
          ),
        ).animate().fadeIn(duration: 500.ms).scale(delay: 500.ms).move(delay: 300.ms, duration: 600.ms),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/background.png"), fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    right: 30, left: 30, top: 80, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              Hero(
                                tag: 'pic',
                                child: Stack(
                                  alignment: Alignment.center,
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
                                                color: Colors.black, width: 5)),
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
                                        width: MediaQuery.of(context).size.width *
                                            0.2,
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
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.020,
                                            )),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.035,
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "John William",
                                    style: GoogleFonts.inter(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .headlineLarge,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  const EditProfileScreen()));
                                    },
                                    child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.08,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.1,
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                160, 139, 139, 139),
                                            border: Border.all(
                                                style: BorderStyle.solid,
                                                width: 5),
                                            shape: BoxShape.circle),
                                        child: const Image(
                                            image: AssetImage(
                                                "assets/editprofile.png"))),
                                  )
                                ],
                              ),
                              Text(
                                "John_william@gmail.com",
                                style: GoogleFonts.inter(
                                  textStyle:
                                      Theme.of(context).textTheme.bodySmall,
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Text(
                                "(269)-748-9882",
                                style: GoogleFonts.inter(
                                  textStyle:
                                      Theme.of(context).textTheme.bodySmall,
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              const ChangePassword()));
                                },
                                child: Text('Change password',
                                    style: GoogleFonts.inter(
                                      decoration: TextDecoration.underline,
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .headlineMedium,
                                    )),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )),
                          minimumSize: MaterialStateProperty.all(Size(
                              MediaQuery.of(context).size.width,
                              MediaQuery.of(context).size.height / 19))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: const AssetImage("assets/deleteaccount.png"),
                            height: MediaQuery.of(context).size.height * 0.025,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.065,
                          ),
                          Text("Delete Account",
                              style: GoogleFonts.inter(
                                color: const Color(0xff99181E),
                                textStyle:
                                    Theme.of(context).textTheme.labelLarge,
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.09,
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                color: const Color(0xff2D2D2D),
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 30, left: 30, top: 20, bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Subscription",
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
                          const Icon(Icons.bookmark),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.035,
                          ),
                          Text(
                            "Business Standard package",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.inter(
                              textStyle: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.015,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.calendar_month),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.035,
                          ),
                          Text(
                            "1 Marh 2023 - 2 April 2023",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.inter(
                              textStyle: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.015,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.person),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.035,
                          ),
                          Text(
                            "2/3",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.inter(
                              textStyle: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      Mainbutton(
                        buttontext: "Upgrade Subscription",
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const SubscriptionPlanScreen(
                                        pagename: "Upgrade Plan",
                                      )));
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.13,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30, left: 30, bottom: 20),
                child: Mainbutton(
                  buttontext: "Log out",
                  onPressed: () {
                    userPreference.removeUser().then((value) {
                       Navigator.of(context, rootNavigator: true).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                    });
                   
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
