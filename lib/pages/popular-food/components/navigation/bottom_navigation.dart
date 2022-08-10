import 'package:flutter/material.dart';
import 'package:food_delivery/pages/popular-food/components/navigation/counter_controller_button.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/add_to_cart_button.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key? key, required this.price,
  }) : super(key: key);
  final int price;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.heightDetailBottomNavigation,
      padding: EdgeInsets.symmetric(
        vertical: Dimensions.height30,
        horizontal: Dimensions.width20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimensions.height20),
          topRight: Radius.circular(Dimensions.height20),
        ),
        color: AppColors.buttonBackgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CounterControllerButton(),
          AddToCartButton(price: price)
        ],
      ),
    );
  }
}

