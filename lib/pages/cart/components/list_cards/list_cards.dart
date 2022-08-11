import 'package:flutter/material.dart';
import 'package:food_delivery/models/cart_item.dart';
import 'package:food_delivery/pages/cart/components/list_cards/card_food.dart';

class ListCards extends StatelessWidget {
  const ListCards({
    Key? key, required this.list,
  }) : super(key: key);
  final List<CartItem> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (_, index) {
        void changeCountMethod(int count) {
          // controller.setQuantity(count);
        }
        return CardFood(
          image: list[index].img!,
          title: list[index].name!,
          price: list[index].price!,
          count: list[index].quantity!,
          clickHandler: changeCountMethod,
        );
      },
    );
  }
}
