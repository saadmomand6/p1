import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../../components/button.dart';
import '../../../../data/response/status.dart';
import '../../../../view_models/jolt_history_view_model.dart';
import '../createjolt/create_jolt.dart';
import 'components/details_card.dart';

class DetailsScreen extends StatefulWidget {
  final String? contactid;
  final String name;
  final String email;
  final String number;
  final String imageurl;
  final int numberofjolts;
  const DetailsScreen(
      {required this.contactid,
      required this.name,
      required this.email,
      required this.number,
      required this.numberofjolts,
      required this.imageurl,
      super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen>
    with TickerProviderStateMixin {
  JoltHistoryViewModel jh = JoltHistoryViewModel();

  String? selectedContactId;

  @override
  void initState() {
    super.initState();
    jh.getJoltHistoryApiModel(widget.contactid);
    print('ooooooo ${widget.contactid}');
  }

  @override
  Widget build(BuildContext context) {
    //DetailsModel detailtItem = DetailsHelper.getchatitem(widget.id);
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(
            "Details",
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
                  image: AssetImage("assets/background.png"),
                  fit: BoxFit.cover),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 0, left: 0, top: 50, bottom: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: DetailsCard(
                            name: widget.name,
                            email: widget.email,
                            number: widget.number,
                            imageurl: widget.imageurl.toString(),
                            numberofjolts: widget.numberofjolts,
                            contactid: widget.contactid),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: const Color(0xff2D2D2D).withOpacity(0.7),
                        alignment: Alignment.topLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 30, left: 30, top: 20, bottom: 10),
                              child: Text(
                                "Jolt history",
                                textAlign: TextAlign.left,
                                style: GoogleFonts.inter(
                                  textStyle:
                                      Theme.of(context).textTheme.labelLarge,
                                ),
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.007,
                            ),
                            const Divider(
                              height: 5,
                              thickness: 3,
                              color: Color(0xff5E5E5E),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.015,
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.only(
                            //       right: 30, left: 30, top: 0, bottom: 10),
                            //   child: Row(
                            //     children: [
                            //       Expanded(
                            //         flex: 3,
                            //         child: Container(
                            //           decoration: const BoxDecoration(
                            //               color: Color.fromARGB(
                            //                   255, 155, 154, 149),
                            //               borderRadius: BorderRadius.all(
                            //                   Radius.circular(10))),
                            //           child: Padding(
                            //             padding: const EdgeInsets.symmetric(
                            //                 horizontal: 20, vertical: 15),
                            //             child: Text(
                            //               "Grandma had an heart attack get home",
                            //               style: GoogleFonts.inter(
                            //                 textStyle: TextStyle(
                            //                     color: Colors.white,
                            //                     fontSize: MediaQuery.of(context)
                            //                             .size
                            //                             .width *
                            //                         0.035,
                            //                     fontWeight: FontWeight.w400),
                            //               ),
                            //               textAlign: TextAlign.start,
                            //             ),
                            //           ),
                            //         ),
                            //       ),
                            //       SizedBox(
                            //         width: MediaQuery.of(context).size.width *
                            //             0.035,
                            //       ),
                            //       Expanded(
                            //         flex: 1,
                            //         child: Text(
                            //           "13:00 \n 25.3.2023",
                            //           textAlign: TextAlign.left,
                            //           style: GoogleFonts.inter(
                            //             textStyle: TextStyle(
                            //                 color: Colors.white,
                            //                 fontSize: MediaQuery.of(context)
                            //                         .size
                            //                         .width *
                            //                     0.030,
                            //                 fontWeight: FontWeight.w400),
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            // SizedBox(
                            //   height:
                            //       MediaQuery.of(context).size.height * 0.015,
                            // ),
                            // Padding(
                            //   padding: const EdgeInsets.only(
                            //       right: 30, left: 30, top: 0, bottom: 10),
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.end,
                            //     children: [
                            //       Expanded(
                            //         flex: 1,
                            //         child: Text(
                            //           "13:00 \n26.3.2023",
                            //           textAlign: TextAlign.end,
                            //           style: GoogleFonts.inter(
                            //             textStyle: TextStyle(
                            //                 color: Colors.white,
                            //                 fontSize: MediaQuery.of(context)
                            //                         .size
                            //                         .width *
                            //                     0.030,
                            //                 fontWeight: FontWeight.w400),
                            //           ),
                            //         ),
                            //       ),
                            //       SizedBox(
                            //         width: MediaQuery.of(context).size.width *
                            //             0.035,
                            //       ),
                            //       Expanded(
                            //         flex: 3,
                            //         child: Container(
                            //           decoration: const BoxDecoration(
                            //               color: Color(0xffFFEEA8),
                            //               borderRadius: BorderRadius.all(
                            //                   Radius.circular(10))),
                            //           child: Padding(
                            //             padding: const EdgeInsets.symmetric(
                            //                 horizontal: 20, vertical: 15),
                            //             child: Text(
                            //               "We are leaving for funeral",
                            //               textAlign: TextAlign.end,
                            //               style: GoogleFonts.inter(
                            //                 textStyle: TextStyle(
                            //                     color: const Color(0xff161616),
                            //                     fontSize: MediaQuery.of(context)
                            //                             .size
                            //                             .width *
                            //                         0.035,
                            //                     fontWeight: FontWeight.w400),
                            //               ),
                            //             ),
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            // SizedBox(
                            //   height:
                            //       MediaQuery.of(context).size.height * 0.020,
                            // ),
                            SizedBox(
                              height: 300,
                              child: ChangeNotifierProvider<
                                  JoltHistoryViewModel>.value(
                                value: jh,
                                child: Consumer<JoltHistoryViewModel>(
                                  builder: (context, value, _) {
                                    switch (value.jolthistorylist.status) {
                                      case Status.LOADING:
                                        return const Center(
                                            child: CircularProgressIndicator(
                                          color: Color.fromARGB(
                                              255, 197, 155, 206),
                                        ));
                                      case Status.ERROR:
                                        return Text(value
                                            .jolthistorylist.message
                                            .toString());
                                      case Status.COMPLETED:
                                        print('status is completred now');
                                        return Column(
                                          children: [
                                            Expanded(
                                              child: AnimationLimiter(
                                                child: ListView.builder(
                                                    itemCount: value
                                                        .jolthistorylist
                                                        .data!
                                                        .success!
                                                        .data!
                                                        .length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      selectedContactId = value
                                                          .jolthistorylist
                                                          .data!
                                                          .success!
                                                          .data![index]
                                                          .id;
                                                       if (value
                                                          .jolthistorylist
                                                          .data!
                                                          .success!
                                                          .data![index]
                                                          .id != widget.contactid) {
                                                        return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                right: 30,
                                                                left: 30,
                                                                top: 0,
                                                                bottom: 10),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Expanded(
                                                              flex: 1,
                                                              child: Text(
                                                                value
                                                                    .jolthistorylist
                                                                    .data!
                                                                    .success!
                                                                    .data![
                                                                        index]
                                                                    .createdAt
                                                                    .toString(),
                                                                textAlign:
                                                                    TextAlign
                                                                        .end,
                                                                style:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  textStyle: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize: MediaQuery.of(context)
                                                                              .size
                                                                              .width *
                                                                          0.030,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.035,
                                                            ),
                                                            Expanded(
                                                              flex: 3,
                                                              child: Container(
                                                                decoration: const BoxDecoration(
                                                                   color: Color.fromARGB(255, 155, 154, 149),
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(10))),
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                          .symmetric(
                                                                      horizontal:
                                                                          20,
                                                                      vertical:
                                                                          15),
                                                                  child: Text(
                                                                    value
                                                                        .jolthistorylist
                                                                        .data!
                                                                        .success!
                                                                        .data![
                                                                            index]
                                                                        .message
                                                                        .toString(),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .end,
                                                                    style: GoogleFonts
                                                                        .inter(
                                                                      textStyle: TextStyle(
                                                                          color: const Color(
                                                                              0xff161616),
                                                                          fontSize: MediaQuery.of(context).size.width *
                                                                              0.035,
                                                                          fontWeight:
                                                                              FontWeight.w400),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                      } else{
                                                        return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                right: 30,
                                                                left: 30,
                                                                top: 0,
                                                                bottom: 10),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Expanded(
                                                              flex: 3,
                                                              child: Container(
                                                                decoration: const BoxDecoration(
                                                                    color: Color(
                                                                        0xffFFEEA8),
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(10))),
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                          .symmetric(
                                                                      horizontal:
                                                                          20,
                                                                      vertical:
                                                                          15),
                                                                  child: Text(
                                                                    value
                                                                        .jolthistorylist
                                                                        .data!
                                                                        .success!
                                                                        .data![
                                                                            index]
                                                                        .message
                                                                        .toString(),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .end,
                                                                    style: GoogleFonts
                                                                        .inter(
                                                                      textStyle: TextStyle(
                                                                          color: const Color(
                                                                              0xff161616),
                                                                          fontSize: MediaQuery.of(context).size.width *
                                                                              0.035,
                                                                          fontWeight:
                                                                              FontWeight.w400),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.035,
                                                            ),
                                                            Expanded(
                                                              flex: 1,
                                                              child: Text(
                                                                value
                                                                    .jolthistorylist
                                                                    .data!
                                                                    .success!
                                                                    .data![
                                                                        index]
                                                                    .createdAt
                                                                    .toString(),
                                                                textAlign:
                                                                    TextAlign
                                                                        .end,
                                                                style:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  textStyle: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize: MediaQuery.of(context)
                                                                              .size
                                                                              .width *
                                                                          0.030,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400),
                                                                ),
                                                              ),
                                                            ),
                                                            
                                                            
                                                          ],
                                                        ),
                                                      );
                                                      }
                                                      
                                                      // return AnimationConfiguration
                                                      //     .staggeredList(
                                                      //   position: index,
                                                      //   duration:
                                                      //       const Duration(
                                                      //           milliseconds:
                                                      //               1200),
                                                      //   child: SlideAnimation(
                                                      //     verticalOffset: 50.0,
                                                      //     child:
                                                      //         FadeInAnimation(
                                                      //       child: JolttactCard(
                                                      //         name: value!
                                                      //             .jolthistorylist!
                                                      //             .data!
                                                      //             .success!
                                                      //             .data![
                                                      //                 index]
                                                      //             .name,
                                                      //         // imageurl:
                                                      //         //     joltItem.imageurl.toString(),
                                                      //         time: value!
                                                      //             .jolthistorylist!
                                                      //             .data!
                                                      //             .success!
                                                      //             .data![
                                                      //                 index]
                                                      //             .createdAt,
                                                      //         contactid: value!
                                                      //             .jolthistorylist!
                                                      //             .data!
                                                      //             .success!
                                                      //             .data![
                                                      //                 index]
                                                      //             .id,
                                                      //         email:
                                                      //             'email',
                                                      //         numberofjolt:
                                                      //             3,
                                                      //         contactnumber:
                                                      //             '000000',
                                                      //       ),
                                                      //     ),
                                                      //   ),
                                                      // );
                                                    }),
                                              ),
                                            ),
                                          ],
                                        );
                                      default:
                                    }
                                    return Container();
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 30, left: 30, top: 0, bottom: 10),
                        child: Mainbutton(
                          buttontext: "Sent jolt",
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => CreateJoltScreen(
                                          recievername: widget.name,
                                        )));
                          },
                        ),
                      ),
                    ]),
              ),
            )));
  }
}
