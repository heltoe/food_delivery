import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';

class Description extends StatelessWidget {
  const Description({
    Key? key,
    required this.clickHandler,
    required this.text,
  }) : super(key: key);
  final void Function() clickHandler;
  final String text;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          recognizer: TapGestureRecognizer()
            ..onTap = clickHandler,
          text: text,
          style: TextStyle(
            color: Colors.grey[500],
            fontSize: Dimensions.height20,
          )),
    );
  }
}
