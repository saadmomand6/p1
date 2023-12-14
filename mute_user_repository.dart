import 'package:joltconnection/data/network/base_api_service.dart';
import 'package:joltconnection/data/network/network_api_service.dart';
import '../components/app_urls.dart';

class MuteUserRepository {
  final BaseApiService _apiservice = NetworkApiService();

    Future<dynamic> muteUserApi(dynamic data) async {
    try {
      dynamic response =
          await _apiservice.getPostApiResponse(AppUrls.muteUserUrl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}