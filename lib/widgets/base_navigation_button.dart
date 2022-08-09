import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';

class BaseNavigationButton extends StatelessWidget {
  const BaseNavigationButton({
    Key? key,
    required this.widget, required this.backgroundColor,
  }) : super(key: key);
  final Widget widget;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.height20),
        color: backgroundColor,
      ),
      padding: EdgeInsets.symmetric(
        vertical: Dimensions.height15,
        horizontal: Dimensions.width20,
      ),
      child: widget,
    );
  }
}
