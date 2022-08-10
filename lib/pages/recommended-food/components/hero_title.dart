import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/base_text.dart';

class HeroTitle extends StatelessWidget {
  const HeroTitle({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimensions.height20),
          topRight: Radius.circular(Dimensions.height20),
        ),
      ),
      width: double.maxFinite,
      padding: const EdgeInsets.only(top: 5, bottom: 10),
      child: Center(
        child: BaseText(
          text: title,
          size: Dimensions.height26,
        ),
      ),
    );
  }
}
