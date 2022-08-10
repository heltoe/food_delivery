import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/base_navigation_button.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/base_text.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    Key? key,
    required this.price,
  }) : super(key: key);
  final int price;

  @override
  Widget build(BuildContext context) {
    return BaseNavigationButton(
      widget: BaseText(text: "\$ $price | Add to cart", color: Colors.white),
      backgroundColor: AppColors.mainColor,
    );
  }
}
