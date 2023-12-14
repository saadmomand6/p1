import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screens/home/home.dart';
import '../screens/notifications/notifications.dart';
import '../screens/profile/profile.dart';
import '../screens/setting/settings.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final CupertinoTabController _tabController = CupertinoTabController();
  final GlobalKey<NavigatorState> _homeNavigatorKey =GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
            backgroundColor: const Color(0xff484848),
            activeColor: Colors.white,
            inactiveColor: const Color.fromARGB(255, 104, 102, 102),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
              ),
            ]),
        tabBuilder: (context, index) {
          return CupertinoTabView(
            navigatorKey: index == 0 ? _homeNavigatorKey : null,
            builder: (context) {
              if (index == 0) {
                return const CupertinoPageScaffold(child: HomeScreen());
              } else if (index == 1) {
                return const CupertinoPageScaffold(
                    child: NotificationsScreen());
              } else if (index == 2) {
                return const CupertinoPageScaffold(child: ProfileScreen());
              } else if (index == 3) {
                return const CupertinoPageScaffold(child: SettingsScreen());
              }

              return Container();
            },
          );
          // switch(index){
          //    case 0:
          //    return CupertinoTabView(
          //     builder: (context) {
          //       return const CupertinoPageScaffold(child: HomeScreen());
          //     },
          //    );
          //    case 1:
          //    return CupertinoTabView(
          //     builder: (context) {
          //       return const CupertinoPageScaffold(child: NotificationsScreen());
          //     },
          //    );
          //    case 2:
          //    return CupertinoTabView(
          //     builder: (context) {
          //       return const CupertinoPageScaffold(child: ProfileScreen());
          //     },
          //    );
          //    case 3:
          //    return CupertinoTabView(
          //     builder: (context) {
          //       return const CupertinoPageScaffold(child: SettingsScreen());
          //     },
          //    );
          // }
          // return Container();
        },
        controller: _tabController,
      ),
      onWillPop: () async {
        if (_tabController.index != 0) {
          _tabController.index = 0;
          return false; // Prevent exiting the app
        } else {
          final shouldPop = await showDialog<bool>(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Exit'),
                  content: const Text('Are you sure you want to exit the app?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        exit(0);
                      },
                      child: const Text(
                        'Yes',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                      child: const Text(
                        'No',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                );
              });
          return shouldPop ?? false;
        }
      },
    );
  }
}
