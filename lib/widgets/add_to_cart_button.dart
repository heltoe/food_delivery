import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/base_navigation_button.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/base_text.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    Key? key,
    required this.price,
    required this.count,
    this.clickHandler,
  }) : super(key: key);
  final int price;
  final int count;
  final void Function()? clickHandler;


  @override
  Widget build(BuildContext context) {
    return BaseNavigationButton(
      widget: BaseText(text: "\$ ${count == 0 ? price : price * count} | Add to cart", color: Colors.white),
      backgroundColor: AppColors.mainColor,
      clickHandler: clickHandler,
    );
  }
}
