import 'package:flutter/material.dart';
import 'package:food_delivery/pages/food/components/body_detail_page.dart';
import 'package:food_delivery/pages/food/components/navigation/bottom_navigation.dart';
import 'package:food_delivery/pages/food/components/header.dart';
import 'package:food_delivery/pages/food/components/hero_image.dart';
import 'package:food_delivery/utils/dimensions.dart';

class FoodDetailPage extends StatelessWidget {
  const FoodDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: HeroImage(),
          ),
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Header(),
          ),
          Positioned(
            top: Dimensions.heightDetailFoodImage - 20,
            bottom: 0,
            left: 0,
            right: 0,
            child: BodyDetailPage(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}

