import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:app_settings/app_settings.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;

class FirebaseNotificationServices {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  void requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: true,
        criticalAlert: true,
        provisional: true,
        sound: true);
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("user granted permission");
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print("user granted provisional permission");
    } else {
      AppSettings.openAppSettings(type: AppSettingsType.notification);
      print("user denied permission");
    }
  }

  Future<String> getDeviceToken() async {
    String? token = await messaging.getToken();
    return token!;
  }

  void isTokenRefresh() async {
    messaging.onTokenRefresh.listen((event) {
      event.toString();
      print('refresh token');
    });
  }

  void localNotificationInit(
      BuildContext context, RemoteMessage message) async {
    var androidInitializationSettings =
        const AndroidInitializationSettings("@mipmap/ic_launcher");
    // var iosInitializationSettings = const DarwinInitializationSettings();

    var initializationSetting = InitializationSettings(
      android: androidInitializationSettings,
      //  iOS: iosInitializationSettings
    );

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSetting,
      onDidReceiveNotificationResponse: (payload) {
        handleMessage(context, message);
      },
    );
  }

  void firebaseInit(BuildContext context) {
    FirebaseMessaging.onMessage.listen((message) {
      print(message.notification!.title.toString());
      print(message.notification!.body.toString());
      // if (Platform.isIOS) {
      //   foregroundMessage();
      // }
      if (Platform.isAndroid) {
        localNotificationInit(context, message);
        showNotification(message);
      } else {
        showNotification(message);
      }
    });
  }

  Future<void> showNotification(RemoteMessage message) async {
    AndroidNotificationChannel channel = AndroidNotificationChannel(
        Random.secure().nextInt(100000).toString(),
        "High Importance Notification",
        importance: Importance.max);

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
            channel.id.toString(), channel.name.toString(),
            channelDescription: 'your channel description',
            importance: Importance.high,
            priority: Priority.high,
            ticker: 'ticker',
            icon: "@mipmap/ic_launcher");

    // const DarwinNotificationDetails darwinNotificationDetails =
    //     DarwinNotificationDetails(
    //   presentAlert: true,
    //   presentBadge: true,
    //   presentSound: true,
    // );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      //  iOS: darwinNotificationDetails
    );

    Future.delayed(Duration.zero, () {
      _flutterLocalNotificationsPlugin.show(
          0,
          message.notification!.title.toString(),
          message.notification!.body.toString(),
          notificationDetails);
    });
  }

  void handleMessage(BuildContext context, RemoteMessage message) {
    if (message.data != null) {
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => ));
    }
  }

  Future<void> setupInteractMessage(BuildContext context) async {
    //when app is terminated
    RemoteMessage? initialmessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (initialmessage != null) {
      handleMessage(context, initialmessage);
    }

    //when app is in background
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      handleMessage(context, event);
    });
  }

  // Future foregroundMessage() async {
  //   await FirebaseMessaging.instance
  //       .setForegroundNotificationPresentationOptions(
  //     alert: true,
  //     badge: true,
  //     sound: true,
  //   );
  // }
  static String firebasemessagingscope =
      "https://www.googleapis.com/auth/firebase.messaging";

  Future<String> getAccessToken() async {
    final client = await clientViaServiceAccount(
      
        [firebasemessagingscope]);
    final String accestoken = client.credentials.accessToken.data;
    return accestoken;
  }

// 'https://fcm.googleapis.com/v1/projects/badgr-ios/messages:send'
// 'https://fcm.googleapis.com/fcm/send'
  Future<void> sendPushNotification(
      String fcmToken, String messageBody, String senderName) async {
    try {
      String acceskey = await getAccessToken();
      print('access $acceskey');
      print('notification sent on fcmToken= $fcmToken');
      print('notification senderName = $senderName');
      print('notification messageBody = $messageBody');
      var url = Uri.parse(
          'https://fcm.googleapis.com/v1/projects/badgr-ios/messages:send');
      var headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $acceskey', // Your FCM server key
      };
      String fcm = await getDeviceToken();
      print("fcm $fcm");
      var data = {
        "message": {
          // "token": fcmToken, // FCM token for the recipient
          "token": fcm,
          "notification": {
            "title": senderName,
            "body": messageBody,
          },
          "android": {
            "priority": "HIGH", // Priority setting for Android
          },
          // "apns": {
          //   "headers": {
          //     "apns-priority": "10", // Priority setting for iOS
          //   },
          // },
        }
      };

      var response =
          await http.post(url, headers: headers, body: jsonEncode(data));

      if (response.statusCode == 200) {
        print("Notification sent successfully");
        print(response.body);
      } else {
        print("Failed to send notification: ${response.statusCode}");
        print("Response body: ${response.body}");
      }
    } catch (e) {
      print("Error sending notification: $e");
    }
  }
}
