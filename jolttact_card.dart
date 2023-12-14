import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../main.dart';
import '../../../view_models/contact_view_model.dart';
import 'createjolt/create_jolt.dart';
import 'menu/menu.dart';

class JolttactCard extends StatefulWidget {
  final String name;
  final String time;
  final String email;
  final String? contactid;
  final String contactnumber;
  final int numberofjolt;
  final String imageurl = "assets/man2.jpeg";
  final bool? isconnected;
  List? selectednames = [];

  JolttactCard({
    required this.name,
    required this.time,
    required this.numberofjolt,
    this.contactid,
    required this.email,
    required this.isconnected,
    // this.imageurl,
    required this.contactnumber,
    this.selectednames,
    super.key,
  });
  @override
  State<JolttactCard> createState() => _JolttactCardState();
}

class _JolttactCardState extends State<JolttactCard> {
  Color concolor = Colors.grey.withOpacity(0.2);
  bool isShow = false;
  @override
  Widget build(BuildContext context) {
    final contactViewModel = Provider.of<ContactViewModel>(context);
    return Consumer<MassJoltdata>(
      builder: (context, value, child) {
        return InkWell(
          onTap: () {
            if (value.multiplejolt > 0) {
              if (concolor == Colors.grey.withOpacity(0.2)) {
                setState(() {
                  concolor = Colors.grey.withOpacity(0.5);
                  Provider.of<MassJoltdata>(context, listen: false)
                      .addtomassjolt();
                  widget.selectednames!.add(widget.name);
                  isShow = !isShow;
                });
              } else if (concolor == Colors.grey.withOpacity(0.5)) {
                setState(() {
                  concolor = Colors.grey.withOpacity(0.2);
                  Provider.of<MassJoltdata>(context, listen: false)
                      .deletefrommassjolt();
                  widget.selectednames!.remove(widget.name);
                  isShow = !isShow;
                });
              }
            } else if (value.multiplejolt == 0) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => CreateJoltScreen(
                            recievername: widget.name,
                            contactid: widget.contactid,
                          )));
            }
          },
          onLongPress: () {
            setState(() {
              concolor = Colors.grey.withOpacity(0.5);
              Provider.of<MassJoltdata>(context, listen: false).addtomassjolt();
              widget.selectednames!.add(widget.name);
              isShow = !isShow;
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Container(
              color: concolor,
              child: ListTile(
                  leading: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => CreateJoltScreen(
                                    recievername: widget.name,
                                    contactid: widget.contactid,
                                  )));
                    },
                    child: Stack(children: [
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: concolor == Colors.grey.withOpacity(0.5)
                                    ? Colors.white
                                    : Colors.transparent,
                                width: 1)),
                        child: const CircleAvatar(
                          backgroundImage: AssetImage("assets/man2.jpeg"),
                          radius: 30,
                        ),
                      ),
                      if (concolor == Colors.grey.withOpacity(0.5))
                        Positioned.fill(
                          left: 45,
                          child: Icon(
                            Icons.check_circle,
                            size: MediaQuery.of(context).size.height * 0.03,
                            color: Colors.white,
                          ),
                        )
                    ]),
                  ),
                  title: InkWell(
                    onTap: () {},
                    child: Text(
                      widget.name,
                      style: GoogleFonts.inter(
                        textStyle: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                  ),
                  subtitle: Text(
                    widget.time,
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.030,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (widget.isconnected == true)
                        Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.white),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(18)),
                            ),
                            child: Row(
                              children: [
                                const Text(
                                  '3',
                                  style: TextStyle(fontSize: 13.0),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.015,
                                ),
                                Image(
                                  image:
                                      const AssetImage("assets/joltnumber.png"),
                                  height: MediaQuery.of(context).size.height *
                                      0.018,
                                )
                              ],
                            )),
                      if (widget.isconnected == false)
                        InkWell(
                          onTap: () {
                            Map<String, dynamic> data = {
                              "contactId": widget.contactid
                            };
                            contactViewModel.sendJoltRequestsApiModel(
                                data, context);
                          },
                          child: Image(
                            image: const AssetImage("assets/inviteuser.png"),
                            height: MediaQuery.of(context).size.height * 0.025,
                          ),
                        ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.010,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => MenuScreen(
                                        contactid: widget.contactid,
                                        name: widget.name,
                                        email: widget.email,
                                        number: widget.contactnumber,
                                        numberofjolt: widget.numberofjolt,
                                        imageurl: widget.imageurl,
                                      )));
                        },
                        child: const Icon(
                          Icons.more_vert_outlined,
                          size: 30,
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        );
      },
    );
  }
}
