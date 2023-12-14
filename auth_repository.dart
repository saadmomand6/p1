import 'package:joltconnection/data/network/base_api_service.dart';
import 'package:joltconnection/data/network/network_api_service.dart';
import '../components/app_urls.dart';

class AuthRepository {
  final BaseApiService _apiservice = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiservice.getPostApiResponse(AppUrls.loginUrl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> signupApi(dynamic data) async {
    try {
      dynamic response =
          await _apiservice.getPostApiResponse(AppUrls.signupUrl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> forgotPasswordApi(dynamic data) async {
    try {
      dynamic response =
          await _apiservice.getPostApiResponse(AppUrls.forgotPasswordUrl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> resetPasswordApi(dynamic data) async {
    try {
      dynamic response =
          await _apiservice.getPostApiResponse(AppUrls.resetPasswordUrl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> verifyUserApi(dynamic data) async {
    try {
      dynamic response =
          await _apiservice.getPostApiResponse(AppUrls.verifyUserUrl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
