import 'package:flutter/material.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/common_wrapper.dart';
import 'package:food_delivery/widgets/to_cart_btn.dart';
import 'package:get/get.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonWrapper(
      widget: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppIcon(
            icon: Icons.arrow_back_ios,
            iconColor: Colors.white,
            backgroundColor: AppColors.mainColor,
            iconSize: Dimensions.height24,
            clickHandler: () {
              Get.toNamed(RouteHelper.initial);
            },
          ),
          SizedBox(width: Dimensions.width20 * 9),
          AppIcon(
            icon: Icons.home_outlined,
            iconColor: Colors.white,
            backgroundColor: AppColors.mainColor,
            iconSize: Dimensions.height24,
            clickHandler: () {
              Get.toNamed(RouteHelper.initial);
            },
          ),
          ToCartBtn(
            countInCart: 0,
            iconColor: Colors.white,
            iconSize: Dimensions.height24,
            backgroundColor: AppColors.mainColor,
          ),
        ],
      ),
    );
  }
}