import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/navbar.dart';
import '../screens/login_screen.dart';

class UserViewModel with ChangeNotifier {
  Future<String?> getUser(BuildContext context) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('token');
    if (token == null || token == '') {
      print("user not found");
      if (context.mounted) {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const LoginScreen()));
      }
    } else {
      print("user found");
      if (context.mounted) {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const NavBar()));
      }
    }
    return token.toString();
  }

  Future<bool> removeUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('token');
    return true;
  }
}
