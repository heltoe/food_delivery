import 'package:flutter/material.dart';
import 'package:food_delivery/home/components/body_main_page.dart';
import 'package:food_delivery/home/components/main_food_slider/main_food_slider.dart';
import 'package:food_delivery/home/components/header.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/base_text.dart';
import 'package:food_delivery/widgets/common_wrapper.dart';
import 'package:food_delivery/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: Dimensions.height45),
          CommonWrapper(widget: Header()),
          SizedBox(height: Dimensions.height15),
          Expanded(
            child: SingleChildScrollView(
              child: BodyMainPage(),
            ),
          ),
        ],
      ),
    );
  }
}
