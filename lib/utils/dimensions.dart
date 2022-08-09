import 'package:get/get.dart';

class Dimensions {
  // height
  static double screenHeight = Get.context!.height;
  static double screenHeightRounded = screenHeight.floor().toDouble();
  // width
  static double screenWidth = Get.context!.width;
  static double screenWidthRounded = screenWidth.floor().toDouble();
  // dimensions for slider on main page
  static int baseHeightView = 320;
  static double pageViewHeight = screenHeightRounded / (screenHeightRounded / baseHeightView);
  static int baseHeightViewContainer = 220;
  static double pageViewContainerHeight = screenHeightRounded / (screenHeightRounded / baseHeightViewContainer);
  static int baseHeightTextContainer = 130;
  static double pageViewTextContainerHeight = screenHeightRounded / (screenHeightRounded / baseHeightTextContainer);
  // main page list
  static double heightImageCard = screenWidthRounded / (screenWidthRounded / 120);
  // dynamic height
  static double height10 = screenHeightRounded / (screenHeightRounded / 10);
  static double height15 = screenHeightRounded / (screenHeightRounded / 15);
  static double height20 = screenHeightRounded / (screenHeightRounded / 20);
  static double height24 = screenHeightRounded / (screenHeightRounded / 24);
  static double height30 = screenHeightRounded / (screenHeightRounded / 30);
  static double height35 = screenHeightRounded / (screenHeightRounded / 35);
  static double height40 = screenHeightRounded / (screenHeightRounded / 40);
  static double height45 = screenHeightRounded / (screenHeightRounded / 45);
  // dynamic width
  static double width10 = screenWidthRounded / (screenWidthRounded / 10);
  static double width15 = screenWidthRounded / (screenWidthRounded / 15);
  static double width20 = screenWidthRounded / (screenWidthRounded / 20);
  static double width30 = screenWidthRounded / (screenWidthRounded / 30);
  static double width35 = screenWidthRounded / (screenWidthRounded / 35);
  static double width40 = screenWidthRounded / (screenWidthRounded / 40);
  static double width45 = screenWidthRounded / (screenWidthRounded / 45);
}