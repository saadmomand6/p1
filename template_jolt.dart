import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TemlplateJoltScreen extends StatefulWidget {
  String? selectedmessage;
  Map messaggeslist = {
    1: "Urgent help required! Please respond.",
    2: "Emergency! Call for help.",
    3: "Medical emergency! Send ambulance now.",
    4: 'Accident! Send help immediately.',
    5: "Emergency situation! Please come quickly.",
    6: 'SOS! Please respond quickly',
    7: 'Danger! Send assistance',
  };
  TemlplateJoltScreen({this.selectedmessage, super.key});

  @override
  State<TemlplateJoltScreen> createState() => _TemlplateJoltScreenState();
}

class _TemlplateJoltScreenState extends State<TemlplateJoltScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "Templates",
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
              image: AssetImage("assets/background.png"), fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding:const EdgeInsets.only(right: 30, left: 30, top: 70, bottom: 20),
            child: Container(
              constraints: const BoxConstraints(maxHeight: 1500),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: widget.messaggeslist.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    widget.selectedmessage = widget.messaggeslist.values.elementAt(index);
                                    Navigator.pop(
                                        context, widget.selectedmessage);
                                  });
                                },
                                child: Templatejoltcontainer(
                                  message: widget.messaggeslist.values.elementAt(index),
                                  radius: const BorderRadius.all(
                                      Radius.circular(0)),
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.007,
                              )
                            ],
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Templatejoltcontainer extends StatelessWidget {
  final BorderRadius? radius;
  final String message;
  const Templatejoltcontainer({
    required this.message,
    this.radius,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.4), borderRadius: radius),
        padding:
            const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
        child: Row(
          children: [
            Expanded(
              child: Text(message,
                  style: GoogleFonts.inter(
                   textStyle: Theme.of(context).textTheme.bodySmall,
                  )),
            ),
          ],
        ));
  }
}
