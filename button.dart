import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Mainbutton extends StatelessWidget {
  final String buttontext;
  final VoidCallback onPressed;
  const Mainbutton({
    required this.buttontext,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:onPressed,
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          )),
          minimumSize: MaterialStateProperty.all(Size(
              MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height / 16))),
      child: Text(
        buttontext,
         style:  GoogleFonts.inter(textStyle: TextStyle(color: const Color(0xff99181E),fontSize: MediaQuery.of(context).size.width * 0.045,fontWeight: FontWeight.w500),)
      ),
    );
  }
}