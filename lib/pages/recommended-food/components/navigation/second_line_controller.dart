import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/add_to_cart_button.dart';
import 'package:food_delivery/pages/recommended-food/components/navigation/wish_controller_button.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';

class SecondLineController extends StatelessWidget {
  const SecondLineController({
    Key? key,
    required this.price,
    required this.count,
    required this.clickHandler,
  }) : super(key: key);
  final int price;
  final int count;
  final void Function() clickHandler;

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
          WishControllerButton(),
          AddToCartButton(
            price: price,
            count: count,
            clickHandler: clickHandler,
          ),
        ],
      ),
    );
  }
}
