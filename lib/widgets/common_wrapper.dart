import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';

class CommonWrapper extends StatelessWidget {
  const CommonWrapper({
    Key? key,
    this.padding = 0,
    required this.widget,
  }) : super(key: key);
  final double padding;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: padding == 0 ? Dimensions.width20 : padding),
      child: widget,
    );
  }
}
