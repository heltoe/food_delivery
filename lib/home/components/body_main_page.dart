import 'package:flutter/material.dart';
import 'package:food_delivery/home/components/list_cards/list_cards.dart';
import 'package:food_delivery/home/components/list_cards/list_cards_title.dart';
import 'package:food_delivery/home/components/main_food_slider/main_food_slider.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/common_wrapper.dart';

class BodyMainPage extends StatelessWidget {
  const BodyMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MainFoodSlider(),
        SizedBox(height: Dimensions.height30),
        CommonWrapper(widget: ListCardsTitle()),
        CommonWrapper(widget: ListCards()),
      ],
    );
  }
}
