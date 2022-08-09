import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/common_wrapper.dart';
import 'package:food_delivery/widgets/small_text.dart';

class ExpandableText extends StatefulWidget {
  const ExpandableText({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstHalfText;
  late String secondHalfText;

  bool hiddenText = true;
  double textHeight = Dimensions.heightExpandedText;

  void toggleHiddenText() {
    setState(() {
      hiddenText = !hiddenText;
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalfText = widget.text.substring(0, textHeight.toInt());
      secondHalfText =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalfText = widget.text;
      secondHalfText = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return CommonWrapper(
      widget: Container(
        padding: EdgeInsets.only(
            top: Dimensions.height10, bottom: Dimensions.height20),
        child: secondHalfText.isEmpty
            ? SmallText(
                text: firstHalfText,
                size: Dimensions.height16,
                color: AppColors.paraColor,
                lineHeight: 1.8,
              )
            : Column(
                children: [
                  SmallText(
                    text: hiddenText
                        ? "$firstHalfText ..."
                        : "$firstHalfText$secondHalfText",
                    size: Dimensions.height16,
                    color: AppColors.paraColor,
                    lineHeight: 1.8,
                  ),
                  InkWell(
                    onTap: toggleHiddenText,
                    child: Row(
                      children: [
                        const SmallText(
                          text: "Show more",
                          color: AppColors.mainColor,
                        ),
                        SizedBox(width: Dimensions.width10),
                        Icon(
                          hiddenText
                              ? Icons.arrow_drop_down
                              : Icons.arrow_drop_up,
                          color: AppColors.mainColor,
                        ),
                      ],
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
