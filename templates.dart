import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/alert_screen.dart';

class TemlplatesScreen extends StatefulWidget {
  const TemlplatesScreen({super.key});

  @override
  State<TemlplatesScreen> createState() => _TemlplatesScreenState();
}

class _TemlplatesScreenState extends State<TemlplatesScreen> {
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
            padding:
                const EdgeInsets.only(right: 30, left: 30, top: 120, bottom: 20),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   const Templatecontainer(
                      message: "This is an emergency! Please call 911 or emergency services.",
                      radius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.007,
                    ),
                  const  Templatecontainer(
                      message: "Urgent help required! Please respond.",
                       radius: BorderRadius.all(Radius.circular(0)),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.007,
                    ),
                  const  Templatecontainer(
                     message:"Emergency! Call for help.",
                      radius: BorderRadius.all(Radius.circular(0)),
                     ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.007,
                    ),
                   const Templatecontainer(
                      message: 'Medical emergency! Send ambulance.',
                       radius: BorderRadius.all(Radius.circular(0)),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.007,
                    ),
                  const Templatecontainer(
                      message: "Accident! Send help immediately.",
                       radius: BorderRadius.all(Radius.circular(0)),
                    ),
                                        SizedBox(
                      height: MediaQuery.of(context).size.height * 0.007,
                    ),
                    const Templatecontainer(
                      message: 'I am in a dangerous situation and need immediate help. Please come quickly',
                       radius: BorderRadius.all(Radius.circular(0)),
                     ),
                                        SizedBox(
                      height: MediaQuery.of(context).size.height * 0.007,
                    ),
                    const Templatecontainer(
                      message: "SOS! Please respond quickly",
                       radius: BorderRadius.all(Radius.circular(0)),
                     ),
                                        SizedBox(
                      height: MediaQuery.of(context).size.height * 0.007,
                    ),
                    const Templatecontainer(
                      message: 'Danger! Send assistance',
                      radius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),),
                                        SizedBox(
                      height: MediaQuery.of(context).size.height * 0.007,
                    ),
                   
                   
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ); 
  }
}

class Templatecontainer extends StatelessWidget {
  final BorderRadius? radius;
  final String message;
  const Templatecontainer({
    required this.message,
    this.radius,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.4),
        borderRadius: radius
      ),
      padding: const EdgeInsets.only(top: 12, left: 20, right: 20, bottom: 12),
      child: Row(
        children: [
          Expanded(
            child: Text(message,
            style:  GoogleFonts.inter(textStyle: Theme.of(context).textTheme.bodySmall,)),
          ),
          InkWell(
            onTap: (){
               Navigator.push(context,
                        MaterialPageRoute(builder: (_) => AlertScreen(
 backgrounimg: "assets/background.png",
                                  backcolor: Colors.grey.withOpacity(0.3),
                                  iconimg: "assets/deleteicon2.png",
                                  iconsize: MediaQuery.of(context).size.height * 0.2,
                                  title: "Delete!",
                                  description:
                                      "Are you sure you want to delete this.",
                                  buttontext: "Delete",
                                    ontap: () {
                                     Navigator.pop(context);
                                    },
                                  )
                                  ));
            },
            child: Image(image: const AssetImage("assets/deleteicon.png"),
            height: MediaQuery.of(context).size.height * 0.040,
            ),
          )
        ],
      )
    );
  }
}
