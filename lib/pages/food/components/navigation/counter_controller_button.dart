import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/base_navigation_button.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/base_text.dart';

class CounterControllerButton extends StatelessWidget {
  const CounterControllerButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseNavigationButton(
      widget: Row(
        children: [
          Icon(Icons.remove, color: AppColors.signColor),
          SizedBox(width: Dimensions.width10),
          BaseText(text: "20"),
          SizedBox(width: Dimensions.width10),
          Icon(Icons.add, color: AppColors.signColor),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}