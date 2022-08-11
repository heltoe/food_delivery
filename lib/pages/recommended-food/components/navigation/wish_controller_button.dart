import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/base_navigation_button.dart';
import 'package:food_delivery/utils/colors.dart';

class WishControllerButton extends StatelessWidget {
  const WishControllerButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseNavigationButton(
      widget: Icon(Icons.favorite, color: AppColors.mainColor),
      backgroundColor: Colors.white,
      clickHandler: () {},
    );
  }
}