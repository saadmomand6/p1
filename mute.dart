import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../../components/navbar.dart';
import '../../../../view_models/mute_user_view_model.dart';
import '../menu/menu_card.dart';

class MuteScreen extends StatefulWidget {
  final String? contactid;
  const MuteScreen({required this.contactid, super.key});

  @override
  State<MuteScreen> createState() => _MuteScreenState();
}

class _MuteScreenState extends State<MuteScreen> {
  @override
  Widget build(BuildContext context) {
    final muteuserviewmodel = Provider.of<MuteUserViewModel>(context);
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(
            "Mute",
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
                          Map<String, dynamic> data = {
                            "requestId": widget.contactid,
                            "duration": 30,
                          };
                          muteuserviewmodel.muteUserApiModel(data, context);
                          Navigator.of(context, rootNavigator: true).push(
                              MaterialPageRoute(
                                  builder: (context) => const NavBar()));
                        },
                        text: "30 min",
                      ),
                      MenuCard(
                        onpressed: () {
                          Map<String, dynamic> data = {
                            "requestId": widget.contactid,
                            "duration": 60
                          };
                          muteuserviewmodel.muteUserApiModel(data, context);
                          Navigator.of(context, rootNavigator: true).push(
                              MaterialPageRoute(
                                  builder: (context) => const NavBar()));
                        },
                        text: "1 hour",
                      ),
                      MenuCard(
                        onpressed: () {
                          Map<String, dynamic> data = {
                            "requestId": widget.contactid,
                            "duration": 1440
                          };
                          muteuserviewmodel.muteUserApiModel(data, context);
                          Navigator.of(context, rootNavigator: true).push(
                              MaterialPageRoute(
                                  builder: (context) => const NavBar()));
                        },
                        text: "1 day",
                      ),
                      MenuCard(
                        onpressed: () {
                          Map<String, dynamic> data = {
                            "requestId": widget.contactid,
                            "duration": 10080
                          };
                          muteuserviewmodel.muteUserApiModel(data, context);
                          Navigator.of(context, rootNavigator: true).push(
                              MaterialPageRoute(
                                  builder: (context) => const NavBar()));
                        },
                        text: "1 week",
                      ),
                    ]),
              ),
            )));
  }
}
