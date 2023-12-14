import 'package:flutter/material.dart';
import 'package:joltconnection/screens/notifications/request_accepted.dart';
import '../../components/alert_screen.dart';
import '../../components/navbar.dart';
import 'notifications.dart';

class NotificationItemModel {
  String name;
  String time;
  String imageurl;
  Widget? icon;

  NotificationItemModel(this.name, this.time, this.imageurl, this.icon);
}

class NotificationHelper {
  static var chatList = [
    NotificationItemModel("Anna Bella sent you a jolt.", 'Today 08:29 AM',
        "assets/woman.jpeg", null),
    NotificationItemModel("A new member has joined Jolt! View the details.",
        'Yesterday 02:53 PM', "assets/man.jpg", Builder(builder: (context) {
      return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => AlertScreen(
                          backgrounimg: "assets/background.png",
                          backcolor: Colors.grey.withOpacity(0.3),
                          iconimg: "assets/notification2.png",
                          iconsize: MediaQuery.of(context).size.height * 0.2,
                          title: "Ooops!",
                          description: "Something went wrong.",
                          buttontext: "Go to Home",
                          ontap: () {
                            Navigator.of(context, rootNavigator: true).push(
                                MaterialPageRoute(
                                    builder: (context) => const NavBar()));
                          },
                        )));
          },
          child: Icon(Icons.person_add, size: MediaQuery.of(context).size.height * 0.04,));
    })),
    NotificationItemModel(
        "Shawn J has requested to connect with you",
        'Yesterday 11:21 AM',
        "assets/man2.jpeg",
        Row(
          children: [
            Builder(
              builder: (context) {
                return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const RequestAcceptedScreen()));
                    },
                    child:Icon(
                      Icons.check_circle,
                      size: MediaQuery.of(context).size.height * 0.04,
                      color: Colors.green,
                    ) );
              },
            ),
            const SizedBox(
              width: 15,
            ),
            Builder(builder: (context) {
              return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => AlertScreen(
                                  backgrounimg: "assets/background.png",
                                  backcolor: Colors.grey.withOpacity(0.3),
                                  iconimg: "assets/deleteicon2.png",
                                  iconsize:
                                      MediaQuery.of(context).size.height * 0.2,
                                  title: "Delete!",
                                  description:
                                      "Are you sure you want to delete this.",
                                  buttontext: "Delete",
                                  ontap: () {
                                    Navigator.of(context, rootNavigator: false)
                                        .push(MaterialPageRoute(
                                            builder: (context) =>
                                                const NotificationsScreen()));
                                  },
                                )));
                  },
                  child: Icon(Icons.cancel_sharp, size: MediaQuery.of(context).size.height * 0.04,color: Colors.red));
            }),
          ],
        )),
    NotificationItemModel(
        "K Sen sent you a jolt.", '10-03-2023', "assets/man3.jpeg", null),
    NotificationItemModel(
        "Alishe sent you a jolt.", '06-03-2023', "assets/woman2.jpeg", null),
    NotificationItemModel(
        "Tom sent you a jolt", '07-01-2022', "assets/man4.jpeg", null),
  ];
  static NotificationItemModel getnotificationitem(int index) {
    return chatList[index];
  }

  static var itemCount = chatList.length;
}
