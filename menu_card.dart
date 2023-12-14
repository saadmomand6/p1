import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuCard extends StatelessWidget {
  final VoidCallback onpressed;
  final String text;
  const MenuCard({
    required this.onpressed,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              color: Colors.grey.withOpacity(0.2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Text(
                text,
                style: GoogleFonts.inter(
                  textStyle: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),
          )),
    );
  }
}
