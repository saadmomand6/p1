import 'dart:convert';
import 'dart:io';
import 'package:joltconnection/data/app_exceptions.dart';
import 'package:joltconnection/data/network/base_api_service.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class NetworkApiService extends BaseApiService {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
     final SharedPreferences sp = await SharedPreferences.getInstance();
      final String? token = sp.getString('token');
    try {
      Response response = await http.get(
        Uri.parse(url),
         headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        );
        print("this is status code ${response.statusCode}");
      responseJson = returnResponse(response);
       print("this is our $responseJson");
        if (responseJson['error'] != null) {
        print(responseJson['error']);
        if (responseJson['error']['code'] == 422) {
          print('success code is ${responseJson['error']['code']}');
          throw InvalidInputExceptions('${responseJson['error']['message']}');
        } else if (responseJson['error']['code'] == 421) {
          print('success code is ${responseJson['error']['code']}');
          throw InvalidInputExceptions('${responseJson['error']['message']}');
        } else if (responseJson['error']['code'] == 404) {
          print('success code is ${responseJson['error']['code']}');
          throw InvalidInputExceptions('${responseJson['error']['message']}');
        }
      }
    } on SocketException {
      throw FetchDataExceptions('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    final SharedPreferences sp = await SharedPreferences.getInstance();
      final String? token = sp.getString('token');
    try {
      Response response = await post(
        Uri.parse(url),
        headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(data),
      );
      print("this is status code ${response.statusCode}");
      responseJson = returnResponse(response);
      print("this is our $responseJson");
      if (responseJson['error'] != null) {
        print(responseJson['error']);
        if (responseJson['error']['code'] == 422) {
          print('success code is ${responseJson['error']['code']}');
          throw InvalidInputExceptions('${responseJson['error']['message']}');
        } else if (responseJson['error']['code'] == 421) {
          print('success code is ${responseJson['error']['code']}');
          throw InvalidInputExceptions('${responseJson['error']['message']}');
        } else if (responseJson['error']['code'] == 404) {
          print('success code is ${responseJson['error']['code']}');
          throw InvalidInputExceptions('${responseJson['error']['message']}');
        }
      }
    } on SocketException {
      throw FetchDataExceptions('No Internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responsejson = jsonDecode(response.body.toString());
        return responsejson;
      case 400:
        throw BadRequestExceptions(response.body.toString());
      case 422:
        throw InvalidInputExceptions('Incorrect email or password');
      case 421:
        throw InvalidInputExceptions('The email has already been taken.');
      case 404:
        throw UnAuthorizedExceptions(response.body.toString());
      default:
        throw FetchDataExceptions(
            'Error Occured While Communicating with Server with Status Code${response.statusCode}');
    }
  }
}
