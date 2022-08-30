import 'package:get/get.dart';

class Dimensions {
  // common
  // base height
  static double screenHeight = Get.context!.height;
  static double screenHeightRounded = screenHeight.floor().toDouble();
  // base width
  static double screenWidth = Get.context!.width;
  static double screenWidthRounded = screenWidth.floor().toDouble();
  // dynamic height
  static double height10 = screenHeightRounded / (screenHeightRounded / 10);
  static double height15 = screenHeightRounded / (screenHeightRounded / 15);
  static double height16 = screenHeightRounded / (screenHeightRounded / 16);
  static double height20 = screenHeightRounded / (screenHeightRounded / 20);
  static double height24 = screenHeightRounded / (screenHeightRounded / 24);
  static double height26 = screenHeightRounded / (screenHeightRounded / 26);
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
  static double width250 = screenWidthRounded / (screenWidthRounded / 250);

  // main_food_page
  // dimensions for slider on main page
  static int baseHeightView = 320;
  static double pageViewHeight = screenHeightRounded / (screenHeightRounded / baseHeightView);
  static int baseHeightViewContainer = 220;
  static double pageViewContainerHeight = screenHeightRounded / (screenHeightRounded / baseHeightViewContainer);
  static int baseHeightTextContainer = 130;
  static double pageViewTextContainerHeight = screenHeightRounded / (screenHeightRounded / baseHeightTextContainer);
  // main page list
  static double heightImageCard = screenWidthRounded / (screenWidthRounded / 120);

  // food_detail_page
  static double heightDetailFoodImage = screenWidthRounded / (screenWidthRounded / 350);
  static double heightDetailBottomNavigation = screenHeightRounded / (screenHeightRounded / 120);
  static double heightExpandedText = screenHeightRounded / (screenHeightRounded / 130);
}