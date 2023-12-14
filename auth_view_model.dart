import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/alert_screen.dart';
import '../components/navbar.dart';
import '../components/toast.dart';
import '../repository/auth_repository.dart';
import '../screens/forgotpassword/new_password.dart';
import '../screens/login_screen.dart';
import '../screens/signup/verify_email.dart';
import '../screens/subscription/subscription_plan_screen.dart';

class AuthViewModel with ChangeNotifier {
  final _authrepo = AuthRepository();

  Future<void> loginApiModel(dynamic data, BuildContext context) async {
    _authrepo.loginApi(data).then((value) async {
      // final userPreferences =
      //     Provider.of<UserViewModel>(context, listen: false);
      // userPreferences.saveUser(UserModel(token: value['token'].toString()));
      final SharedPreferences sp = await SharedPreferences.getInstance();
      sp.setString('token', value['success']['data']['token'].toString());
      notifyListeners();
      print('user token stored login');
      alertDialog("Congrates! You Logged in",
          const Color.fromARGB(255, 7, 192, 53), Colors.white);
      if (context.mounted) {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const NavBar()));
      }
    }).onError((error, stackTrace) {
      alertDialog(
          error.toString(), const Color.fromARGB(255, 230, 9, 9), Colors.white);
    });
  }

  Future<void> signupApiModel(dynamic data, BuildContext context) async {
    _authrepo.signupApi(data).then((value) async {
      final SharedPreferences sp = await SharedPreferences.getInstance();
      sp.setString('token', value['success']['data']['token'].toString());
      notifyListeners();
      print('user token stored signup');
      if (context.mounted) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => VerifyyYourEmail(
                      token: value['success']['data']['token'].toString(),
                    )));
      }
    }).onError((error, stackTrace) {
      alertDialog(
          error.toString(), const Color.fromARGB(255, 230, 9, 9), Colors.white);
    });
  }

  Future<void> forgotPasswordApiModel(
      String email, dynamic data, BuildContext context) async {
    _authrepo.forgotPasswordApi(data).then((value) {
      alertDialog("Email sent to given email with reset password link",
          const Color.fromARGB(255, 7, 192, 53), Colors.white);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => NewPassword(
                    email: email,
                  )));
    }).onError((error, stackTrace) {
      alertDialog(
          error.toString(), const Color.fromARGB(255, 230, 9, 9), Colors.white);
    });
  }

  Future<void> resetPasswordApiModel(dynamic data, BuildContext context) async {
    _authrepo.resetPasswordApi(data).then((value) {
      alertDialog("Password Saved Successfully",
          const Color.fromARGB(255, 7, 192, 53), Colors.white);
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const LoginScreen()));
    }).onError((error, stackTrace) {
      alertDialog(
          error.toString(), const Color.fromARGB(255, 230, 9, 9), Colors.white);
    });
  }

  Future<void> verifyUserApiModel(dynamic data, BuildContext context) async {
    _authrepo.verifyUserApi(data).then((value) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => AlertScreen(
                    backgrounimg: "assets/background3.png",
                    backcolor: const Color.fromARGB(255, 58, 56, 56),
                    iconimg: "assets/verifyicon.png",
                    iconsize: MediaQuery.of(context).size.height * 0.2,
                    title: "Verified",
                    description:
                        "Voila! You have successfully verified the account",
                    buttontext: "Get Started",
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const SubscriptionPlanScreen(
                                    pagename: "Subscription Plan",
                                  )));
                    },
                  )));
    }).onError((error, stackTrace) {
      alertDialog(
          error.toString(), const Color.fromARGB(255, 230, 9, 9), Colors.white);
    });
  }
}
