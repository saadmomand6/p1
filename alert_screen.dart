import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'button.dart';

class AlertScreen extends StatelessWidget {
  final String backgrounimg;
  final Color backcolor;
  final String iconimg;
  final double iconsize;
  final String title;
  final String description;
  final String buttontext;
  final VoidCallback ontap;
  const AlertScreen(
      {required this.backgrounimg,
      required this.backcolor,
      required this.iconimg,
      required this.iconsize,
      required this.title,
      required this.description,
      required this.buttontext,
      required this.ontap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(backgrounimg), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: backcolor,
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.5,
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image(
                    image: AssetImage(iconimg),
                    height: iconsize,
                    width: MediaQuery.of(context).size.width * 0.3,
                  ),
                  Text(title,
                      style: GoogleFonts.inter(
                        textStyle: Theme.of(context).textTheme.headlineLarge,
                      )),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.height * 0.035),
                    child: Text(description,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          textStyle: Theme.of(context).textTheme.bodySmall,
                        )),
                  ),
                  Mainbutton(
                    buttontext: buttontext,
                    onPressed: ontap,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
