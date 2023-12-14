import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../detail/details.dart';
import 'menu_card.dart';
import '../mute/mute.dart';

class MenuScreen extends StatefulWidget {
  final String? contactid;
  final String name;
  final String email;
  final String number;
  final String imageurl;
  final int numberofjolt;
  const MenuScreen(
      {required this.contactid,
      required this.name,
      required this.email,
      required this.number,
      required this.numberofjolt,
      required this.imageurl,
      super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(
            "Menu",
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
        body: Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/background.png"),
                  fit: BoxFit.cover),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 30, left: 30, top: 250, bottom: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                      MenuCard(
                        onpressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => DetailsScreen(
                                        contactid: widget.contactid,
                                        name: widget.name,
                                        email: widget.email,
                                        number: widget.number,
                                        numberofjolts: widget.numberofjolt,
                                        imageurl: widget.imageurl,
                                      )));
                        },
                        text: "Details",
                      ),
                      MenuCard(
                        onpressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => MuteScreen(
                                        contactid: widget.contactid,
                                      )));
                        },
                        text: "Mute",
                      ),
                      MenuCard(
                        onpressed: () {},
                        text: "Change jolt message allowed",
                      ),
                      MenuCard(
                        onpressed: () {},
                        text: "Remove",
                      ),
                    ]),
              ),
            )));
  }
}
