import 'package:flutter/material.dart';
import 'package:food_delivery/pages/popular-food/components/navigation/counter_controller_button.dart';
import 'package:food_delivery/helper/counter_operation.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/add_to_cart_button.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key? key,
    required this.price,
    required this.count,
    required this.changeCountMethod,
    required this.addToCartHandler,
  }) : super(key: key);
  final int price;
  final int count;
  final void Function(CounterOperation type) changeCountMethod;
  final void Function() addToCartHandler;

  void clickHandler(CounterOperation type) {
    changeCountMethod(type);
  }

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
          CounterControllerButton(clickHandler: clickHandler, count: count),
          AddToCartButton(
            price: price,
            count: count,
            clickHandler: addToCartHandler,
          ),
        ],
      ),
    );
  }
}
