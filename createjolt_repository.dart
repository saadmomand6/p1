import 'package:joltconnection/data/network/base_api_service.dart';
import 'package:joltconnection/data/network/network_api_service.dart';
import '../components/app_urls.dart';
import '../models/jolttact_model.dart';

class CreateJoltRepository {
  final BaseApiService _apiservice = NetworkApiService();

    Future<dynamic> createJoltApi(dynamic data) async {
    try {
      dynamic response =
          await _apiservice.getPostApiResponse(AppUrls.createJoltUrl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
