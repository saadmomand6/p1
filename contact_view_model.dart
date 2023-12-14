import 'package:flutter/material.dart';
import 'package:joltconnection/data/response/api_response.dart';
import '../components/toast.dart';
import '../models/jolttact_model.dart';
import '../repository/contact_repository.dart';

class ContactViewModel with ChangeNotifier {
  final _contactrepo = ContactRepository();

  Future<void> syncContactsApiModel(dynamic data, BuildContext context) async {
    _contactrepo.syncContactsApi(data).then((value) {
      alertDialog(
          "Contacts Sync", const Color.fromARGB(255, 7, 192, 53), Colors.white);
    }).onError((error, stackTrace) {
      alertDialog(
          error.toString(), const Color.fromARGB(255, 230, 9, 9), Colors.white);
    });
  }

  ApiResponse<JoltTact> jolttactslist = ApiResponse.loading();

  setJolttactList(ApiResponse<JoltTact> response) {
    jolttactslist = response;
    print('jnjnjnjnjnj ${jolttactslist.status}');
    notifyListeners();
  }

  Future<void> getContactsApiModel() async {
    setJolttactList(ApiResponse.loading());
    _contactrepo.getContactsApi().then((value) {
      print('uhuhuhuhuh ${value!.success!.data!.first.name}');
      setJolttactList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setJolttactList(ApiResponse.error(error.toString()));
      alertDialog(
          error.toString(), const Color.fromARGB(255, 230, 9, 9), Colors.white);
    });
  }


    Future<void> sendInviteApiModel(dynamic data, BuildContext context) async {
    _contactrepo.sendInviteApi(data).then((value) {
      alertDialog(
          "Invitation Sent", const Color.fromARGB(255, 7, 192, 53), Colors.white);
    }).onError((error, stackTrace) {
      alertDialog(
          error.toString(), const Color.fromARGB(255, 230, 9, 9), Colors.white);
    });
  }

    Future<void> sendJoltRequestsApiModel(dynamic data, BuildContext context) async {
    _contactrepo.sendJoltRequestApi(data).then((value) {
      alertDialog(
          "Jolt Request Sent", const Color.fromARGB(255, 7, 192, 53), Colors.white);
    }).onError((error, stackTrace) {
      alertDialog(
          error.toString(), const Color.fromARGB(255, 230, 9, 9), Colors.white);
    });
  }

}
