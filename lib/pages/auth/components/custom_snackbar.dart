import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/base_text.dart';
import 'package:get/get.dart';

void showCustomSnackBar(String message,
    {bool isError = true, String title = "Error"}) {
  Get.snackbar(
    title,
    message,
    titleText: BaseText(
      text: title,
      color: Colors.white,
    ),
    messageText: BaseText(
      text: message,
      color: Colors.white,
    ),
    colorText: Colors.white,
    snackPosition: SnackPosition.TOP,
    backgroundColor: isError ? Colors.redAccent : Colors.grey,
  );
}
