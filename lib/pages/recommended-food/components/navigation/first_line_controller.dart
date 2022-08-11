import 'package:flutter/material.dart';
import 'package:food_delivery/helper/counter_operation.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/base_text.dart';

class FirstLineController extends StatelessWidget {
  const FirstLineController({
    Key? key,
    required this.price,
    required this.clickHandler,
    required this.count,
  }) : super(key: key);
  final int price;
  final int count;
  final void Function(CounterOperation type) clickHandler;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.width20 * 2.5, vertical: Dimensions.height10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              clickHandler(CounterOperation.subtract);
            },
            child: AppIcon(
              icon: Icons.remove,
              backgroundColor: AppColors.mainColor,
              iconColor: Colors.white,
              iconSize: Dimensions.height16,
            ),
          ),
          SizedBox(width: Dimensions.width20),
          BaseText(
            text: "\$ $price X $count",
            color: AppColors.mainBlackColor,
            size: Dimensions.height26,
          ),
          SizedBox(width: Dimensions.width20),
          GestureDetector(
            onTap: () {
              clickHandler(CounterOperation.add);
            },
            child: AppIcon(
              icon: Icons.add,
              backgroundColor: AppColors.mainColor,
              iconColor: Colors.white,
              iconSize: Dimensions.height16,
            ),
          ),
        ],
      ),
    );
  }
}
