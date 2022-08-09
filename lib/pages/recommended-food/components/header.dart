import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/app_icon.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppIcon(icon: Icons.clear),
        AppIcon(icon: Icons.shopping_cart_outlined),
      ],
    );
  }
}