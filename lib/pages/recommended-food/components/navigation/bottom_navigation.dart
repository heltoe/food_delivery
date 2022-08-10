import 'package:flutter/material.dart';
import 'package:food_delivery/pages/recommended-food/components/navigation/first_line_controller.dart';
import 'package:food_delivery/pages/recommended-food/components/navigation/second_line_controller.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key? key,
    required this.price,
  }) : super(key: key);
  final int price;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [FirstLineController(price: price), SecondLineController(price: price)],
    );
  }
}