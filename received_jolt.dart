import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../components/button.dart';
import '../../components/navbar.dart';

class ReceivedJolt extends StatefulWidget {
  final String name;
  final String joltmessage;
  const ReceivedJolt(
      {required this.name, required this.joltmessage, super.key});

  @override
  State<ReceivedJolt> createState() => _ReceivedJoltState();
}

class _ReceivedJoltState extends State<ReceivedJolt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/background3.png"),
              opacity: 1,
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(218, 26, 29, 29).withOpacity(0.7),
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.5,
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image(
                    image: const AssetImage("assets/notification.png"),
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.3,
                  ),
                  Text(widget.name,
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: MediaQuery.of(context).size.width * 0.065,
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.height * 0.035),
                    child: Text(widget.joltmessage,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.045,
                              fontWeight: FontWeight.w400),
                        )),
                  ),
                  Mainbutton(
                      buttontext: "Close",
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const NavBar()));
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
