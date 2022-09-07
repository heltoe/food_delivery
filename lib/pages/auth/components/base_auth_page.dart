import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/auth_controller.dart';
import 'package:food_delivery/pages/auth/components/auth_button.dart';
import 'package:food_delivery/pages/auth/components/custom_snackbar.dart';
import 'package:food_delivery/pages/auth/components/description.dart';
import 'package:food_delivery/pages/auth/components/logo.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:get/get.dart';

class BaseAuthPage extends StatelessWidget {
  const BaseAuthPage({
    Key? key,
    required this.child,
    required this.validate,
    required this.sendForm,
    required this.textBtn,
    required this.clickDescription,
    required this.textDescription,
  }) : super(key: key);

  final bool Function() validate;
  final Future<bool> Function() sendForm;
  final void Function() clickDescription;
  final Widget child;
  final String textBtn;
  final String textDescription;

  @override
  Widget build(BuildContext context) {
    bool isCanShowMessage = true;

    void resetTimer() {
      isCanShowMessage = false;
      Timer(const Duration(seconds: 3), () {
        isCanShowMessage = true;
      });
    }

    void submit() async {
      if (validate()) {
        bool isSuccess = await sendForm();
        if (!isSuccess) {
          showCustomSnackBar("Server error");
        } else {
          Get.toNamed(RouteHelper.getInitial());
        }
      } else {
        if (isCanShowMessage) {
          showCustomSnackBar("Error validation");
          resetTimer();
        }
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: Dimensions.screenHeight * 0.05),
            SizedBox(
              height: Dimensions.screenHeight * 0.25,
              child: const Logo(),
            ),
            SizedBox(height: Dimensions.height30),
            child,
            SizedBox(height: Dimensions.height30),
            GestureDetector(
              onTap: () {
                submit();
              },
              child: AuthButton(text: textBtn),
            ),
            SizedBox(height: Dimensions.height10),
            Description(
              clickHandler: clickDescription,
              text: textDescription,
            ),
            SizedBox(height: Dimensions.height30),
          ],
        ),
      ),
    );
  }
}
