import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationCard extends StatelessWidget {
  final String name;
  final String time;
  final String imageurl;
  final Widget? icon;
  const NotificationCard({
    required this.name,
    required this.time,
    required this.imageurl,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        color: Colors.grey.withOpacity(0.2),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(
              imageurl,
            ),
            radius: 30,
            backgroundColor: Colors.grey,
          ),
          title: Text(
            name,
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width * 0.040,
                  fontWeight: FontWeight.w400),
            ),
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                time,
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width * 0.030,
                      fontWeight: FontWeight.w400),
                ),
              ),
              if (icon != null)
                Center(
                  child: icon,
                )
            ],
          ),
        ),
      ),
    );
  }
}
