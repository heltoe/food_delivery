import 'package:flutter/material.dart';
import 'package:food_delivery/pages/home/components/body_main_page.dart';
import 'package:food_delivery/pages/home/components/header.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/common_wrapper.dart';

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
          const CommonWrapper(widget: Header()),
          SizedBox(height: Dimensions.height15),
          const Expanded(
            child: SingleChildScrollView(
              child: BodyMainPage(),
            ),
          ),
        ],
      ),
    );
  }
}
