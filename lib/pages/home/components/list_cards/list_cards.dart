import 'package:flutter/material.dart';
import 'package:food_delivery/pages/home/components/list_cards/card_food.dart';

class ListCards extends StatelessWidget {
  const ListCards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (_, index) => CardFood(),
    );
  }
}