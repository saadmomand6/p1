import 'package:flutter/material.dart';
import '../components/toast.dart';
import '../repository/mute_user_repository.dart';

class MuteUserViewModel with ChangeNotifier {
  final _contactrepo = MuteUserRepository();

  Future<void> muteUserApiModel(dynamic data, BuildContext context) async {
    _contactrepo.muteUserApi(data).then((value) {
      alertDialog(
          "Contacts Sync", const Color.fromARGB(255, 7, 192, 53), Colors.white);
    }).onError((error, stackTrace) {
      alertDialog(
          error.toString(), const Color.fromARGB(255, 230, 9, 9), Colors.white);
    });
  }
}