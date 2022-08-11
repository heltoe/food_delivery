import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';

class CardFoodContentContainer extends StatelessWidget {
  const CardFoodContentContainer({
    Key? key,
    required this.widget,
    this.padding = 0,
  }) : super(key: key);
  final Widget widget;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(Dimensions.height20),
            bottomRight: Radius.circular(Dimensions.height20),
          ),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.all(padding == 0 ? Dimensions.width10 : padding),
          child: widget,
        ),
      ),
    );
  }
}