import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OptionPaymentMethod extends StatelessWidget {
  final String methodimagelink;
  final double imgsize;
  final String methodname;
  final VoidCallback ontap;
  const OptionPaymentMethod({
    required this.methodimagelink,
    required this.imgsize,
    required this.methodname,
    required this.ontap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: ontap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image(
                image: AssetImage(methodimagelink),
                height: imgsize,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.1,
              ),
              Text(methodname, style: GoogleFonts.inter(
                       textStyle: Theme.of(context).textTheme.labelLarge,
                      ),)
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.025,
        ),
        const Divider(
          height: 8,
          thickness: 5,
          color: Color(0xff5E5E5E),
        )
      ],
    );
  }
}
