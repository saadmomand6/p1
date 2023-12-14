import 'package:flutter/material.dart';
import '../components/toast.dart';
import '../repository/jolt_request_status_repository.dart';

class JoltRequestStatusViewModel with ChangeNotifier {
  final _joltRequestStatusrepo = JoltRequestStatusRepository();

  Future<void> joltRequestStatusApiModel(dynamic data, BuildContext context) async {
    _joltRequestStatusrepo.joltRequestStatusApi(data).then((value) {
      alertDialog(
          "User Muted", const Color.fromARGB(255, 7, 192, 53), Colors.white);
    }).onError((error, stackTrace) {
      alertDialog(
          error.toString(), const Color.fromARGB(255, 230, 9, 9), Colors.white);
    });
  }
}