import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:joltconnection/screens/splash_screen.dart';
import 'package:joltconnection/view_models/auth_view_model.dart';
import 'package:joltconnection/view_models/contact_view_model.dart';
import 'package:joltconnection/view_models/createjolt_view_model.dart';
import 'package:joltconnection/view_models/jolt_history_view_model.dart';
import 'package:joltconnection/view_models/jolt_request_status_view_model.dart';
import 'package:joltconnection/view_models/mute_user_view_model.dart';
import 'package:joltconnection/view_models/user_view_model.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}

@pragma("vm:entry-point")
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print(message.notification!.title.toString());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static GlobalKey<NavigatorState> navigatorkey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MassJoltdata()),
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => UserViewModel()),
        ChangeNotifierProvider(create: (_) => ContactViewModel()),
        ChangeNotifierProvider(create: (_) => CreateJoltViewModel()),
        ChangeNotifierProvider(create: (_) => MuteUserViewModel()),
        ChangeNotifierProvider(create: (_) => JoltHistoryViewModel()),
        ChangeNotifierProvider(create: (_) => JoltRequestStatusViewModel()),
        
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Jolt Connection',
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.red[800],
          fontFamily: 'Inter',
          textTheme: TextTheme(
            headlineLarge: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: MediaQuery.of(context).size.height * 0.024),
            headlineMedium: TextStyle(
                color: const Color(0xffFFEEA8),
                fontSize: MediaQuery.of(context).size.height * 0.020,
                fontWeight: FontWeight.w400),
            bodySmall: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: MediaQuery.of(context).size.height * 0.016),
            labelLarge: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: MediaQuery.of(context).size.height * 0.020),
          ),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}



class MassJoltdata extends ChangeNotifier {
  int multiplejolt = 0;

  void addtomassjolt() {
    multiplejolt++;
    print("$multiplejolt");
    notifyListeners();
  }

  void deletefrommassjolt() {
    if (multiplejolt >= 1) {
      multiplejolt--;
      print("$multiplejolt");
      notifyListeners();
    }
  }
}
