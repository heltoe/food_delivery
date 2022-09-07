import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/auth_controller.dart';
import 'package:food_delivery/models/sign_up_body.dart';
import 'package:food_delivery/pages/auth/components/base_auth_page.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/base_input.dart';
import 'package:food_delivery/widgets/common_wrapper.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();

    bool validate() {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      bool isValid = true;

      if (email.isEmpty || password.isEmpty || name.isEmpty || phone.isEmpty) {
        if (email.isEmpty) {}
        if (password.isEmpty) {}
        if (name.isEmpty) {}
        if (phone.isEmpty) {}
        isValid = false;
      }
      if (password.length < 6 && password.isNotEmpty) {
        isValid = false;
      }
      if (!GetUtils.isEmail(email) && email.isNotEmpty) {
        isValid = false;
      }

      return isValid;
    }

    Future<bool> sendForm() async {
      AuthController authController = Get.find<AuthController>();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      SignUpBody body = SignUpBody(email: email, password: password, name: name, phone: phone);
      bool result = await authController.registration(body);
      return result;
    }

    return BaseAuthPage(
      clickDescription: () => Get.toNamed(RouteHelper.getLogin()),
      textDescription: "Have an account already?",
      textBtn: "Sign up",
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
              isPassword: true,
            ),
          ),
          SizedBox(height: Dimensions.height20),
          CommonWrapper(
            widget: BaseInput(
              controller: nameController,
              hintText: "Name",
              icon: Icons.person,
            ),
          ),
          SizedBox(height: Dimensions.height20),
          CommonWrapper(
            widget: BaseInput(
              controller: phoneController,
              hintText: "Phone",
              icon: Icons.phone,
            ),
          ),
        ],
      ),
    );
  }
}
