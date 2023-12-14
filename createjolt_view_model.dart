import 'package:flutter/material.dart';
import '../components/alert_screen.dart';
import '../components/navbar.dart';
import '../components/toast.dart';
import '../repository/createjolt_repository.dart';

class CreateJoltViewModel with ChangeNotifier {
  final _createjoltrepo = CreateJoltRepository();

    Future<void> createJoltApiApiModel(dynamic data, BuildContext context) async {
    _createjoltrepo.createJoltApi(data).then((value) {
      alertDialog(
          "jolt sent", const Color.fromARGB(255, 7, 192, 53), Colors.white);
       Navigator.push(context,
       PageRouteBuilder(
                            transitionDuration: const Duration(seconds: 3),
                            transitionsBuilder:
                                (context, animation, animationTime, child) {
                              animation = CurvedAnimation(
                                    parent: animation,
                                    curve: Curves.elasticInOut);
                              return ScaleTransition(
                                alignment: Alignment.center,
                                scale: animation,
                                child: child,
                              );
                            },
                            pageBuilder: (context, animation, animationTime) {
                              return  AlertScreen(
                                backgrounimg: "assets/background.png",
                                backcolor: Colors.grey.withOpacity(0.3),
                                iconimg: "assets/successnotification2.png",
                                iconsize: MediaQuery.of(context).size.height * 0.1,
                                title: "Jolt send successfully",
                                description: "",
                                buttontext: "Home",
                                ontap: () {
                                  Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => const NavBar()));
                                },
                              );
                            })
                       );
    }).onError((error, stackTrace) {
      alertDialog(
          error.toString(), const Color.fromARGB(255, 230, 9, 9), Colors.white);
    });
  }
}
