import 'package:flutter/material.dart';
import 'package:food_delivery/helper/counter_operation.dart';
import 'package:food_delivery/widgets/base_navigation_button.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/base_text.dart';

class CounterControllerButton extends StatelessWidget {
  const CounterControllerButton({
    Key? key,
    required this.count,
    required this.clickHandler,
  }) : super(key: key);
  final int count;
  final void Function(CounterOperation type) clickHandler;

  @override
  Widget build(BuildContext context) {
    return BaseNavigationButton(
      widget: Row(
        children: [
          GestureDetector(
            onTap: () {
              clickHandler(CounterOperation.subtract);
            },
            child: const Icon(Icons.remove, color: AppColors.signColor),
          ),
          SizedBox(width: Dimensions.width10),
          BaseText(text: count.toString()),
          SizedBox(width: Dimensions.width10),
          GestureDetector(
            onTap: () {
              clickHandler(CounterOperation.add);
            },
            child: const Icon(Icons.add, color: AppColors.signColor),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
