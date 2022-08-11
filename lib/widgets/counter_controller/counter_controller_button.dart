import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/base_navigation_button.dart';
import 'package:food_delivery/widgets/counter_controller/plus_minus_controller.dart';

class CounterControllerButton extends StatelessWidget {
  const CounterControllerButton({
    Key? key,
    required this.count,
    required this.clickHandler,
  }) : super(key: key);
  final int count;
  final void Function(int count) clickHandler;

  @override
  Widget build(BuildContext context) {
    return BaseNavigationButton(
      widget: PlusMinusController(clickHandler: clickHandler, count: count),
      backgroundColor: Colors.white,
    );
  }
}
