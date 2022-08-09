import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/base_text.dart';

class FirstLineController extends StatelessWidget {
  const FirstLineController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.width20 * 2.5, vertical: Dimensions.height10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppIcon(
            icon: Icons.remove,
            backgroundColor: AppColors.mainColor,
            iconColor: Colors.white,
            iconSize: Dimensions.height16,
          ),
          SizedBox(width: Dimensions.width20),
          BaseText(
            text: "\$12.88 X 0",
            color: AppColors.mainBlackColor,
            size: Dimensions.height26,
          ),
          SizedBox(width: Dimensions.width20),
          AppIcon(
            icon: Icons.add,
            backgroundColor: AppColors.mainColor,
            iconColor: Colors.white,
            iconSize: Dimensions.height16,
          ),
        ],
      ),
    );
  }
}
