import 'package:flutter/material.dart';
import 'package:food_delivery/models/sign_in_body.dart';
import 'package:food_delivery/pages/auth/components/base_auth_page.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/base_input.dart';
import 'package:food_delivery/widgets/common_wrapper.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    bool validate() {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      bool isValid = true;

      if (email.isEmpty || password.isEmpty) {
        if (email.isEmpty) {}
        if (password.isEmpty) {}
      }
      if (password.length < 6 && password.isNotEmpty) {
        isValid = false;
      }
      if (!GetUtils.isEmail(email) && email.isNotEmpty) {
        isValid = false;
      }

      return isValid;
    }

    bool sendForm() {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      SignInBody body = SignInBody(email: email, password: password);
      return true;
    }

    return BaseAuthPage(
      clickDescription: () => Get.toNamed(RouteHelper.getRegistration()),
      textDescription: "Don't have an account?",
      textBtn: "Sign in",
      validate: validate,
      sendForm: sendForm,
      child: Column(
        children: [
          CommonWrapper(
            widget: BaseInput(
              controller: emailController,
              hintText: "Email",
              icon: Icons.email,
            ),
          ),
          SizedBox(height: Dimensions.height20),
          CommonWrapper(
            widget: BaseInput(
              controller: passwordController,
              hintText: "Password",
              icon: Icons.password_sharp,
            ),
          ),
        ],
      ),
    );
  }
}
