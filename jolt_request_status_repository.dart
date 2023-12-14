import 'package:joltconnection/data/network/base_api_service.dart';
import 'package:joltconnection/data/network/network_api_service.dart';
import '../components/app_urls.dart';

class JoltRequestStatusRepository {
  final BaseApiService _apiservice = NetworkApiService();

    Future<dynamic> joltRequestStatusApi(dynamic data) async {
    try {
      dynamic response =
          await _apiservice.getPostApiResponse(AppUrls.joltRequestStatusUrl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

}
