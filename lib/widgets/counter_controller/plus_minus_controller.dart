import 'package:flutter/material.dart';
import 'package:food_delivery/helper/counter_operation.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/base_text.dart';

class PlusMinusController extends StatefulWidget {
  const PlusMinusController({
    Key? key,
    this.clickHandler,
    required this.count,
    this.min = 0,
    this.max = 20,
  }) : super(key: key);
  final void Function(int count)? clickHandler;
  final int count;
  final int min;
  final int max;

  @override
  State<PlusMinusController> createState() => _PlusMinusControllerState();
}

class _PlusMinusControllerState extends State<PlusMinusController> {
  late int localCounter;

  @override
  void initState() {
    super.initState();
    localCounter = widget.count;
  }

  clickHandler(CounterOperation type) {
    bool isIncrement = CounterOperationHelper.isIncrement(type);
    int quantity = localCounter;
    if (isIncrement) {
      if (quantity + 1 <= widget.max) {
        quantity++;
      }
    } else {
      if (quantity - 1 >= widget.min) {
        quantity--;
      }
    }
    setState(() {
      localCounter = quantity;
    });
    if (widget.clickHandler != null) widget.clickHandler!(localCounter);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            clickHandler(CounterOperation.subtract);
          },
          child: const Icon(Icons.remove, color: AppColors.signColor),
        ),
        SizedBox(width: Dimensions.width10),
        BaseText(text: localCounter.toString()),
        SizedBox(width: Dimensions.width10),
        GestureDetector(
          onTap: () {
            clickHandler(CounterOperation.add);
          },
          child: const Icon(Icons.add, color: AppColors.signColor),
        ),
      ],
    );
  }
}
