import 'package:food_delivery/data/repository/auth_repository.dart';
import 'package:food_delivery/models/sign_in_body.dart';
import 'package:food_delivery/models/sign_up_body.dart';
import 'package:get/get.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepository authRepository;

  AuthController({ required this.authRepository });

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  registration(SignUpBody body) async {
    _isLoading = true;
    Response response = await authRepository.registration(body);
    if (response.statusCode == 200) {}
    _isLoading = false;
  }

  login(SignInBody body) async {
    _isLoading = true;
    Response response = await authRepository.login(body);
    if (response.statusCode == 200) {}
    _isLoading = false;
  }
}