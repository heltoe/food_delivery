import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/models/sign_in_body.dart';
import 'package:food_delivery/models/sign_up_body.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepository({ required this.apiClient, required this.sharedPreferences });

  Future<Response> registration(SignUpBody body) async {
    return await apiClient.postData("", body);
  }

  Future<Response> login(SignInBody body) async {
    return await apiClient.postData("", body);
  }
}