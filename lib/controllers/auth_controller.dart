import 'package:food_delivery/data/repository/auth_repository.dart';
import 'package:food_delivery/models/sign_in_body.dart';
import 'package:food_delivery/models/sign_up_body.dart';
import 'package:get/get.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepository authRepository;

  AuthController({required this.authRepository});

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<bool> registration(SignUpBody body) async {
    _isLoading = true;
    update();
    Response response = await authRepository.registration(body);
    bool baseCondition = response.statusCode == 200;
    if (baseCondition) {
      authRepository.saveTokenToSharedPreference(response.body["token"]);
    }
    _isLoading = false;
    update();
    return baseCondition;
  }

  Future<bool> login(SignInBody body) async {
    _isLoading = true;
    update();
    Response response = await authRepository.login(body);
    bool baseCondition = response.statusCode == 200;
    if (baseCondition) {
      authRepository.saveTokenToSharedPreference(response.body["token"]);
    }
    _isLoading = false;
    update();
    return baseCondition;
  }
}
