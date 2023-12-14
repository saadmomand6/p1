import 'package:joltconnection/data/network/base_api_service.dart';
import 'package:joltconnection/data/network/network_api_service.dart';
import '../components/app_urls.dart';
import '../models/jolt_history_model.dart';

class JoltHistoryRepository {
  final BaseApiService _apiservice = NetworkApiService();

    Future<JoltHistory> getJoltHistoryApi(String? contactId) async {
    try {
      String joltHistoryUrl = '${AppUrls.joltHistoryUrl}$contactId';
      dynamic response = await _apiservice.getGetApiResponse(joltHistoryUrl);
      return response = JoltHistory.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

}
