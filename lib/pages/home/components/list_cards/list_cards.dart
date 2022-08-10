import 'package:flutter/material.dart';
import 'package:food_delivery/models/recommended/product_recommended.dart';
import 'package:food_delivery/pages/home/components/list_cards/card_food.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:get/get.dart';

class ListCards extends StatelessWidget {
  const ListCards({
    Key? key,
    required this.productList,
  }) : super(key: key);
  final List<ProductRecommended> productList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: productList.length,
      itemBuilder: (_, index) => GestureDetector(
        onTap: () {
          Get.toNamed(RouteHelper.getRecommendedFood(productList[index].id!));
        },
        child: CardFood(card: productList[index]),
      ),
    );
  }
}
