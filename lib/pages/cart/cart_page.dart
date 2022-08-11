import 'package:flutter/material.dart';
import 'package:food_delivery/pages/cart/components/header.dart';
import 'package:food_delivery/utils/dimensions.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: Dimensions.width20,
            right: Dimensions.width20,
            top: Dimensions.height20 * 3,
            child: Header(),
          ),
        ],
      ),
    );
  }
}

