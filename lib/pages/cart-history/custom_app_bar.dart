import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/base_text.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.mainColor,
      height: 100,
      width: double.maxFinite,
      padding: EdgeInsets.only(top: Dimensions.height45),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          BaseText(
            text: "Cart History",
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}