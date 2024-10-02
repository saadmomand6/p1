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
        ServiceAccountCredentials.fromJson({
          "type": "service_account",
          "project_id": "badgr-ios",
          "private_key_id": "239528498558c52ecf9badef173b7547126e4348",
          "private_key":
              "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC8okms+RQ5Lwaa\nq3BHVDbedtxRpC79YpFdHKy8a8/okPi5B63+ipx3h1yjT6RVDKLNTncb0F7pRWai\nkLt7xmXAw3jOXlLjHGGh5QXGMnkNMBsO5Bx6yK+cUYKYndiKiZjDDrwr5TkHKIr9\nUny1fKHzTbdJfwkrNG35beqLQSChLLYBYO4w2KZpFAuwsy9A0A2LNwuCSd+5sXC3\nbAKEmeTK5V2rKsOpX1Z18Q0PmOOTcy58CLi8BGY+zNJSOTCVsyeg9VidaHBOjqnO\nLIGfkAIdlld/ktCrdfeWYM2JrX98K7EBFfEC4439Rmz2DRxD39WX8mM5BzNVjV2F\nglyZ2HdnAgMBAAECggEACr0mep13hEXkF1wZOUZXFVUo99DkB/LbmbRvNQ7iODhA\noLAKPMqBW+Ct6nI3RcxBXHTSHRhAvwD/ddPNiJ9j3ZSDRSRjjaBpAoF6Ua0/7PtH\nHxLneCoCrWCKkcuyrzhkJP6qwcj79Sdeuks+5EojIinTfHCqAfarKB8U0jaz99jt\nweQOCl/oXB0jCeF5NJrgzMhD6SNJr0d4x01NPJb7UrxUIWuxWLa/MIoe/mwItt7h\nSAUJMNJfrceobhfrtKMN5FCk2XWl+aNKUkYUZND3k9/ryb0h8XefxSuSD8hdH0Vj\nePptWuWeDiM+6nmRFfpY/qTrmRLioFXsT9MsWKDYQQKBgQDeKmco0Ohz5QeKm8PN\nU80l/VqYp20p3jD30mMfXSwcnSQJaWv/IQ2b9mahr7Y3GvG1NgG47i8zp01JOxhr\nDGu1TjaKsaxdTIt8OAfinqufgrDYB5j9eCxUQxFCsU/ff3sjtkV5ThPTCX0Fhc44\n3lkf0ammH3NuCSnzDFjjfj/ThwKBgQDZXJSjYZasgrYKLAXh0UkRtOXwQRV3creQ\nybiAxL8Yi6S55E37U9KpUzHNP/pWF4NQ3dlbNUOzcF1rd00cOfo4HOo52BOqNtPE\ntIL9FLJoLHY6iNxGKCIZj9+vZHJr7xGopOlrm6HDEMo5R7rni3Cvzj/NXKYcffVz\njDQYt+L1IQKBgQDQBdpEMKCH7DsMgV9swfwEh18uMw8XNfKaCghAVOi5/jXBDlJO\nOO/aSnS9Dp9Kp9MNP32LYJMYBZ5rZIcvrRipUovlgAoJ7mNpM7nGa5X9rMzT6wFI\nzR6M46Ok1AwbFO4DeWdB92a+o1LKOgjn3OKM1a/JWgemT7RU3QnaMdunvwKBgBtb\nA3nsdkIP0UlGcRcSd9e6pJWwGzuFPIUEXiwWltZH/NtIWGghDIoy5jmmq6LaIrSy\ntwA7m+GhaqBzy0iaI1uch/3vq8noTI6dCT9As5NYxShowRAzTNdavBQe2CetVtOa\nraXVWG5sVocO9/7cFbqKgo0d8+nyEEoSgxv5SJ8BAoGAF1xN5w4Eyp1oM+TpNMV7\nHWn/yoYwfbYMyzU+6PXt8ofIvMGkP7anjsidpFfrBtTiSKvBbHh3QYs0LoAnucMS\nrW9lc4QISHxA6pplrtIMSr3L466oQAZTvmfDc5cFIaE8XESENNAieucW6zB1Cnui\ndi+QlxlH5Y2sIZKPqPXFK8U=\n-----END PRIVATE KEY-----\n",
          "client_email":
              "firebase-adminsdk-b0dxv@badgr-ios.iam.gserviceaccount.com",
          "client_id": "102248849698563803403",
          "auth_uri": "https://accounts.google.com/o/oauth2/auth",
          "token_uri": "https://oauth2.googleapis.com/token",
          "auth_provider_x509_cert_url":
              "https://www.googleapis.com/oauth2/v1/certs",
          "client_x509_cert_url":
              "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-b0dxv%40badgr-ios.iam.gserviceaccount.com",
          "universe_domain": "googleapis.com"
        }),
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
