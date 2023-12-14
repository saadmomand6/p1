import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsCard extends StatelessWidget {
  final String name;
  final String email;
  final String number;
  final String imageurl;
  final int numberofjolts;
  final String? contactid;
  const DetailsCard({
    required this.name,
    required this.email,
    required this.number,
    required this.imageurl,
    required this.numberofjolts,
    required this.contactid,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: const Color.fromARGB(255, 105, 2, 153),
                              width: 5)),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(imageurl),
                        radius: 45,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.035,
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: GoogleFonts.inter(
                        textStyle: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Text(
                  email,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w200,
                    textStyle: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Text(
                  number,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w200,
                   textStyle: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Text(
                  'jolts Allowed: ${numberofjolts.toString()}',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w200,
                   textStyle: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
