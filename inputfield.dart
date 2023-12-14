import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputField extends StatelessWidget {
  final String hinttext;
  final TextEditingController text;
  final bool isObscureText;
  final IconButton? eye;
  const InputField({
    required this.text,
    required this.hinttext,
    required this.isObscureText,
    this.eye,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: text,
      obscureText: isObscureText,
      cursorColor: const Color(0xff99181E),
        style:  GoogleFonts.inter(textStyle: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.width * 0.042,fontWeight: FontWeight.w600),),
      decoration: InputDecoration(
          hintText: hinttext,
          hintStyle:
              TextStyle(fontSize: MediaQuery.of(context).size.width / 24),
          filled: true,
          fillColor: Colors.transparent,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                width: 1,
              )),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              width: 2,
              color: Colors.white,
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                  width: 1, color:Colors.white)
                  ),
                  suffixIcon: eye,
                  ),
    );
  }
}
