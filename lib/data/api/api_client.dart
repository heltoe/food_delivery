import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;
  final SharedPreferences sharedPreferences;
  late Map<String, String> _mainHeaders;

  ApiClient({ required this.appBaseUrl, required this.sharedPreferences }) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    String localToken = "";
    if (sharedPreferences.containsKey(AppConstants.nameTokenInSharedPreference)) {
      localToken = sharedPreferences.getString(AppConstants.nameTokenInSharedPreference)!;
    }
    token = localToken;
    _mainHeaders = {
      "Content-Type": "application/json; charset=UTF-8",
      "Authorization": "Bearer $token",
    };
  }

  void updateHeader(String token) {
    token = token;
    _mainHeaders = {
      "Content-Type": "application/json; charset=UTF-8",
      "Authorization": "Bearer $token",
    };
  }

  Future<Response> getData(String uri, { Map<String, String>? headers }) async {
    try {
      Response response = await get(uri, headers: headers??_mainHeaders);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postData(String uri, dynamic body) async {
    try {
      Response response = await post(uri, body, headers: _mainHeaders);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}