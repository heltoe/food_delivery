import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/base_text.dart';
import 'package:food_delivery/widgets/small_text.dart';

class ListCardsTitle extends StatelessWidget {
  const ListCardsTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const BaseText(text: "Popular"),
        SizedBox(width: Dimensions.width10),
        Container(
          margin: const EdgeInsets.only(bottom: 3),
          child: const BaseText(text: ".", color: Colors.black26),
        ),
        SizedBox(width: Dimensions.width10),
        Container(
          margin: const EdgeInsets.only(bottom: 3),
          child: const SmallText(text: "Food pairing"),
        ),
      ],
    );
  }
}