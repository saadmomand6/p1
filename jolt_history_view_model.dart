import 'package:flutter/material.dart';
import 'package:joltconnection/data/response/api_response.dart';
import 'package:joltconnection/repository/jolt_history_repository.dart';
import '../components/toast.dart';
import '../models/jolt_history_model.dart';

class JoltHistoryViewModel with ChangeNotifier {
  final _joltHistoryrepo = JoltHistoryRepository();

  ApiResponse<JoltHistory> jolthistorylist = ApiResponse.loading();

  setJolthistoryList(ApiResponse<JoltHistory> response) {
    jolthistorylist = response;
    print('uiiiiiii ${jolthistorylist.status}');
    notifyListeners();
  }

  Future<void> getJoltHistoryApiModel(String? contactId) async {
    setJolthistoryList(ApiResponse.loading());
    _joltHistoryrepo.getJoltHistoryApi(contactId).then((value) {
      //print('uhuhuhuhuh ${value!.success!.data!.first.name}');
      setJolthistoryList(ApiResponse.completed(value));
      print('api hitted succesfully');
    }).onError((error, stackTrace) {
      setJolthistoryList(ApiResponse.error(error.toString()));
      alertDialog(
          error.toString(), const Color.fromARGB(255, 230, 9, 9), Colors.white);
    });
  }
}
