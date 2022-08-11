import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/pages/cart/components/header.dart';
import 'package:food_delivery/pages/cart/components/list_cards/list_cards.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: Dimensions.height20 * 3,
            child: Header(),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: Dimensions.height20 * 6,
            bottom: 0,
            child: Container(
              child: GetBuilder<CartController>(
                builder: (controller) {
                  return ListCards(list: controller.getListCartItems);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
