import 'package:flutter/material.dart';
import 'package:food_delivery/helper/counter_operation.dart';
import 'package:food_delivery/pages/recommended-food/components/navigation/first_line_controller.dart';
import 'package:food_delivery/pages/recommended-food/components/navigation/second_line_controller.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key? key,
    required this.price,
    required this.changeCountMethod,
    required this.count,
    required this.addToCartHandler,
  }) : super(key: key);
  final int price;
  final int count;
  final void Function(CounterOperation type) changeCountMethod;
  final void Function() addToCartHandler;

  void clickHandler(CounterOperation type) {
    print(type);
    changeCountMethod(type);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FirstLineController(
          price: price,
          count: count,
          clickHandler: clickHandler,
        ),
        SecondLineController(
          price: price,
          count: count,
          clickHandler: addToCartHandler,
        ),
      ],
    );
  }
}
