// import 'package:awesome_notifications/awesome_notifications.dart';
import 'dart:io';
// import 'package:flutter/services.dart';
import 'package:flutter/services.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:joltconnection/screens/home/components/createjolt/template_jolt.dart';
import 'package:provider/provider.dart';
import 'package:sound_mode/permission_handler.dart';
// import 'package:sound_mode/permission_handler.dart';
import 'package:sound_mode/sound_mode.dart';
import 'package:sound_mode/utils/ringer_mode_statuses.dart';
// import '../../../../components/alert_screen.dart';
import '../../../../components/button.dart';
import '../../../../components/firebase_notification_services.dart';
import 'package:http/http.dart' as http;
import '../../../../view_models/createjolt_view_model.dart';
// import '../../../../components/local_notification.dart';
//import '../../../../components/navbar.dart';

class CreateJoltScreen extends StatefulWidget {
  final String? contactid;
  final String recievername;
  const CreateJoltScreen(
      {required this.recievername, this.contactid, super.key});

  @override
  State<CreateJoltScreen> createState() => _CreateJoltScreenState();
}

class _CreateJoltScreenState extends State<CreateJoltScreen> {
  final _cjoltmessage = TextEditingController();
  bool switchvalue = true;

  FirebaseNotificationServices firebaseNotificationServices =
      FirebaseNotificationServices();

  // Future<void> _changeSoundMode() async {
  //   const MethodChannel methodChannel = MethodChannel('SoundModeChanger');
  //   try {
  //     // Use the flutter_vibrate package to vibrate the device

  //     // Call the platform-specific method to change sound mode
  //     await methodChannel.invokeMethod('SoundModeChanger');
  //   } on PlatformException catch (e) {
  //     print("Failed to change sound mode: ${e.message}");
  //   }
  // }
//For IOS
  static const platform = MethodChannel('silentJolt');
  String _sendjolt = 'to send jolt.';

  Future<void> _sendingjolt() async {
    String sendjolt;
    try {
      final int result = await platform.invokeMethod('sendingjolt');
      sendjolt = 'jolt send $result .';
    } on PlatformException catch (e) {
      sendjolt = "Failed to send jolt : '${e.message}'.";
    }
    setState(() {
      _sendjolt = sendjolt;
    });
  }

  RingerModeStatus _soundMode = RingerModeStatus.unknown;
  Future<void> _getCurrentSoundMode() async {
    RingerModeStatus ringerStatus = await SoundMode.ringerModeStatus;

    Future.delayed(const Duration(seconds: 1), () async {
      try {
        ringerStatus = await SoundMode.ringerModeStatus;
      } catch (err) {
        ringerStatus = RingerModeStatus.unknown;
      }
      setState(() {
        _soundMode = ringerStatus;
      });
    });
  }

  //for Android
  static const MethodChannel _methodChannel =
      MethodChannel('samples.flutter.dev/donotdisturbmode');
  bool? isDndEnabled;
  Future<void> _checkDndStatus() async {
    bool? _isDndEnabled = await PermissionHandler.permissionsGranted;
    try {
      print(_methodChannel.invokeMethod("isDoNotDisturbEnabled"));
      print(_isDndEnabled);
      print(PermissionHandler.permissionsGranted);
      if (_isDndEnabled !=
          await _methodChannel.invokeMethod('isDoNotDisturbEnabled')) {
        setState(() {
          isDndEnabled = _isDndEnabled;
          print(_isDndEnabled);
          print("'jvhjvhv'");
        });
      } else {
        setState(() {
          isDndEnabled = _isDndEnabled;
          print(_isDndEnabled);
          print('ooooooo');
        });
      }
    } on PlatformException catch (e) {
      print('Error: ${e.message}');
    }
  }

  androidSound() async {
    final player = AudioPlayer();
    await player.play(AssetSource('audio.mp3'));
  }
//   Future<void> _getLocalNotificationPermissionStatus() async {
//     bool? permissionStatus = false;
//     try {
//       permissionStatus = await PermissionHandler.permissionsGranted;
//       print("PERMISSION $permissionStatus");
//     } catch (err) {
//       print(err);
//     }
//     setState(() {
//       permissionStatus == permissionStatus!
//           ? "Permissions Enabled"
//           : "Permissions not granted";
//     });
//   }

  @override
  void initState() {
    super.initState();
    _getCurrentSoundMode();
    if (Platform.isAndroid) {
      _checkDndStatus();
    }
    // LocalNotificationService.initializeNotification();
  }

  @override
  Widget build(BuildContext context) {
    final createjoltviewmodel = Provider.of<CreateJoltViewModel>(context);
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(
            "Create Jolt",
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.normal,
                  fontSize: MediaQuery.of(context).size.width * 0.065,
                  fontWeight: FontWeight.w600),
            ),
          ),
          elevation: 0,
          backgroundColor: const Color.fromARGB(192, 0, 0, 0),
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
                  right: 30, left: 30, top: 50, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.09,
                  ),
                  const Divider(
                    height: 5,
                    thickness: 2,
                    color: Color(0xff5E5E5E),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 9.0),
                    child: Text(
                      widget.recievername,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.inter(
                        textStyle: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ),
                  const Divider(
                    height: 5,
                    thickness: 2,
                    color: Color(0xff5E5E5E),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Text(
                    "Template",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.inter(
                      textStyle: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.032,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              transitionDuration: const Duration(seconds: 1),
                              transitionsBuilder:
                                  (context, animation, animationTime, child) {
                                return ScaleTransition(
                                  alignment: Alignment.center,
                                  scale: animation,
                                  child: child,
                                );
                              },
                              pageBuilder: (context, animation, animationTime) {
                                return TemlplateJoltScreen();
                              }));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.white),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("New",
                              style: Theme.of(context).textTheme.labelLarge),
                          const Icon(Icons.arrow_downward_outlined)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.035,
                  ),
                  TextFormField(
                    scrollPadding: const EdgeInsets.only(bottom: 250),
                    maxLines: 7,
                    controller: _cjoltmessage,
                    cursorColor: Colors.red,
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.055,
                          fontWeight: FontWeight.w600),
                    ),
                    decoration: InputDecoration(
                      hintText: "Write Message",
                      hintStyle: GoogleFonts.inter(
                        color: Colors.grey,
                        textStyle: Theme.of(context).textTheme.labelLarge,
                      ),
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
                          borderSide:
                              const BorderSide(width: 1, color: Colors.white)),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        visualDensity: VisualDensity.compact,
                        checkColor: Colors.white,
                        activeColor: const Color.fromARGB(255, 197, 155, 206),
                        value: switchvalue,
                        onChanged: (bool? value) {
                          setState(() {
                            switchvalue = value!;
                          });
                        },
                      ),
                      Text(
                        "Save this as a template.",
                        style: GoogleFonts.inter(
                          textStyle: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.13,
                  ),
                  Mainbutton(
                    buttontext: "Send Jolt",
                    onPressed: () async {
                      Map<String, dynamic> data = {
                        "contactId": widget.contactid,
                        "message": _cjoltmessage.text.toString(),
                        "saveTemplate": switchvalue,
                        "templateId": "new"
                      };
                      print(widget.contactid);
                      print(_cjoltmessage.text.toString());
                      print(switchvalue);
                      

                      createjoltviewmodel.createJoltApiApiModel(data, context);
                      // if (Platform.isIOS) {
                      //   firebaseNotificationServices
                      //       .getDeviceToken()
                      //       .then((value) async {
                      //     var data = {
                      //       'to': value.toString(),
                      //       'priority': 'high',
                      //       'notification': {
                      //         'title': widget.recievername,
                      //         'body': _cjoltmessage.text,
                      //       },
                      //       'data': {
                      //         'name': widget.recievername,
                      //         'joltmessage': _cjoltmessage.text
                      //       }
                      //     };
                      //     await http.post(
                      //         Uri.parse('https://fcm.googleapis.com/fcm/send'),
                      //         body: jsonEncode(data),
                      //         headers: {
                      //           'Content-Type':
                      //               'application/json; charset=UTF-8',
                      //           'Authorization':
                      //               'key=AAAAkwlhbC4:APA91bEpOd5jD2nbdUFaOBOLuXENLAHVDyEBYKfxflETbRh_h4-9CPAVqECXu6_FDmU74orzZ9QZaC9WrM6eNGQrCOFg4UOqpdAvWDCEP3_ekpLFgw9TfMCa3NrGd6wWL3At1zVU8PWs'
                      //         });
                      //   }).then((value) {
                      //     _sendingjolt();
                      //   });
                      // } else if (Platform.isAndroid) {
                      //   if (_soundMode == RingerModeStatus.normal) {
                      //     firebaseNotificationServices
                      //         .getDeviceToken()
                      //         .then((value) async {
                      //       var data = {
                      //         'to': value.toString(),
                      //         'priority': 'high',
                      //         'notification': {
                      //           'title': widget.recievername,
                      //           'body': _cjoltmessage.text,
                      //         },
                      //         'data': {
                      //           'name': widget.recievername,
                      //           'joltmessage': _cjoltmessage.text
                      //         }
                      //       };
                      //       await http.post(
                      //           Uri.parse(
                      //               'https://fcm.googleapis.com/fcm/send'),
                      //           body: jsonEncode(data),
                      //           headers: {
                      //             'Content-Type':
                      //                 'application/json; charset=UTF-8',
                      //             'Authorization':
                      //                 'key=AAAAkwlhbC4:APA91bEpOd5jD2nbdUFaOBOLuXENLAHVDyEBYKfxflETbRh_h4-9CPAVqECXu6_FDmU74orzZ9QZaC9WrM6eNGQrCOFg4UOqpdAvWDCEP3_ekpLFgw9TfMCa3NrGd6wWL3At1zVU8PWs'
                      //           });
                      //     }).then((value) {
                      //       //function to make sound
                      //       androidSound();
                      //     });
                      //   } else if (_soundMode == RingerModeStatus.silent ||
                      //       _soundMode == RingerModeStatus.vibrate) {
                      //     if (isDndEnabled == true) {
                      //       _soundMode ==
                      //           await SoundMode.setSoundMode(
                      //                   RingerModeStatus.normal)
                      //               .then((value) {
                      //             firebaseNotificationServices
                      //                 .getDeviceToken()
                      //                 .then((value) async {
                      //               var data = {
                      //                 'to': value.toString(),
                      //                 'priority': 'high',
                      //                 'notification': {
                      //                   'title': widget.recievername,
                      //                   'body': _cjoltmessage.text,
                      //                 },
                      //                 'data': {
                      //                   'name': widget.recievername,
                      //                   'joltmessage': _cjoltmessage.text
                      //                 }
                      //               };
                      //               await http.post(
                      //                   Uri.parse(
                      //                       'https://fcm.googleapis.com/fcm/send'),
                      //                   body: jsonEncode(data),
                      //                   headers: {
                      //                     'Content-Type':
                      //                         'application/json; charset=UTF-8',
                      //                     'Authorization':
                      //                         'key=AAAAkwlhbC4:APA91bEpOd5jD2nbdUFaOBOLuXENLAHVDyEBYKfxflETbRh_h4-9CPAVqECXu6_FDmU74orzZ9QZaC9WrM6eNGQrCOFg4UOqpdAvWDCEP3_ekpLFgw9TfMCa3NrGd6wWL3At1zVU8PWs'
                      //                   });
                      //             });
                      //           }).then((value) {
                      //             //function to make sound
                      //             androidSound();
                      //           });
                      //     } else if (isDndEnabled == false) {
                      //       firebaseNotificationServices
                      //           .getDeviceToken()
                      //           .then((value) async {
                      //         var data = {
                      //           'to': value.toString(),
                      //           'priority': 'high',
                      //           'notification': {
                      //             'title': widget.recievername,
                      //             'body': _cjoltmessage.text,
                      //           },
                      //           'data': {
                      //             'name': widget.recievername,
                      //             'joltmessage': _cjoltmessage.text
                      //           }
                      //         };
                      //         await http.post(
                      //             Uri.parse(
                      //                 'https://fcm.googleapis.com/fcm/send'),
                      //             body: jsonEncode(data),
                      //             headers: {
                      //               'Content-Type':
                      //                   'application/json; charset=UTF-8',
                      //               'Authorization':
                      //                   'key=AAAAkwlhbC4:APA91bEpOd5jD2nbdUFaOBOLuXENLAHVDyEBYKfxflETbRh_h4-9CPAVqECXu6_FDmU74orzZ9QZaC9WrM6eNGQrCOFg4UOqpdAvWDCEP3_ekpLFgw9TfMCa3NrGd6wWL3At1zVU8PWs'
                      //             });
                      //       });
                      //     }
                      //   }
                      // }
                      //     Navigator.push(context,
                      // MaterialPageRoute(builder: (_) => AlertScreen(
                      //           backgrounimg: "assets/background.png",
                      //           backcolor: Colors.grey.withOpacity(0.3),
                      //           iconimg: "assets/successnotification2.png",
                      //           iconsize: MediaQuery.of(context).size.height * 0.1,
                      //           title: "Jolt send successfully",
                      //           description:
                      //               "",
                      //           buttontext: "Home",
                      //           ontap: () {
                      //             Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => const NavBar()));
                      //           },
                      //         )
                      //  ));
                    },
                  ),
                ],
              ),
            ))));
  }
}