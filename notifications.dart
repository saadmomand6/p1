import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'notification_card.dart';
import 'notification_model.dart';
import 'package:flutter_animate/flutter_animate.dart';
class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromARGB(186, 31, 22, 39),
          title: Text(
            "Notifications",
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.normal,
                  fontSize: MediaQuery.of(context).size.width * 0.065,
                  fontWeight: FontWeight.w600),
            ),
          ).animate().fadeIn(duration: 500.ms).scale(delay: 500.ms).move(delay: 300.ms, duration: 600.ms),
          bottom: TabBar(
              indicatorColor: const Color.fromARGB(255, 197, 155, 206),
              tabs: [
                Tab(
                    child: Text("Alerts",
                            style: GoogleFonts.inter(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                            ))
                        .animate()
                        .fadeIn(duration: 500.ms)
                        .scale(delay: 500.ms)
                        .move(delay: 300.ms, duration: 600.ms)),
                Tab(
                    child: Text("Invites",
                            style: GoogleFonts.inter(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                            ))
                        .animate()
                        .fadeIn(duration: 500.ms)
                        .scale(delay: 500.ms)
                        .move(delay: 300.ms, duration: 600.ms)),
              ]),
        ),
        body: TabBarView(
          children: [
            Container(
              constraints: const BoxConstraints.expand(),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/background.png"), fit: BoxFit.cover),
              ),
              child: ListView.builder(
                  itemCount: NotificationHelper.itemCount,
                  itemBuilder: (context, index) {
                    NotificationItemModel notificationItem =
                        NotificationHelper.getnotificationitem(index);
                    return NotificationCard(
                      name: notificationItem.name,
                      imageurl: notificationItem.imageurl.toString(),
                      time: notificationItem.time,
                      icon: notificationItem.icon,
                    );
                  })),
                  Container(
              constraints: const BoxConstraints.expand(),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/background.png"), fit: BoxFit.cover),
              ),
              child: ListView.builder(
                  itemCount: NotificationHelper.itemCount,
                  itemBuilder: (context, index) {
                    NotificationItemModel notificationItem =
                        NotificationHelper.getnotificationitem(index);
                    return NotificationCard(
                      name: notificationItem.name,
                      imageurl: notificationItem.imageurl.toString(),
                      time: notificationItem.time,
                      icon: notificationItem.icon,
                    );
                  })),
          ],
        ),
      ),
    );
  }
}
