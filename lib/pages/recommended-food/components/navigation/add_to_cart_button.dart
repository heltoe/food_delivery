import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/base_navigation_button.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/base_text.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseNavigationButton(
      widget: BaseText(text: "\$10 | Add to cart", color: Colors.white),
      backgroundColor: AppColors.mainColor,
    );
  }
}
