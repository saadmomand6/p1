import 'package:joltconnection/data/network/base_api_service.dart';
import 'package:joltconnection/data/network/network_api_service.dart';
import '../components/app_urls.dart';
import '../models/jolttact_model.dart';

class ContactRepository {
  final BaseApiService _apiservice = NetworkApiService();


  Future<dynamic> syncContactsApi(dynamic data) async {
    try {
      dynamic response =
          await _apiservice.getPostApiResponse(AppUrls.syncContactsUrl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

    Future<JoltTact> getContactsApi() async {
    try {
      dynamic response = await _apiservice.getGetApiResponse(AppUrls.getContactsUrl);
      return response = JoltTact.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }


    Future<dynamic> sendInviteApi(dynamic data) async {
    try {
      dynamic response =
          await _apiservice.getPostApiResponse(AppUrls.sendInviteUrl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

    Future<dynamic> sendJoltRequestApi(dynamic data) async {
    try {
      dynamic response =
          await _apiservice.getPostApiResponse(AppUrls.sendJoltRequestUrl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

}
