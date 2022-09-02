import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/base_text.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({
    Key? key,
    this.title = "",
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    Widget renderDescription() {
      return title.isNotEmpty ? BaseText(text: title) : const SizedBox();
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/empty.webp",
          width: Dimensions.width350,
        ),
        renderDescription(),
      ],
    );
  }
}