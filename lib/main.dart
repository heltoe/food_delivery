import 'package:flutter/material.dart';
import 'package:food_delivery/pages/food/food_detail_page.dart';
import 'package:food_delivery/pages/home/main_food_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Food Delivery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FoodDetailPage(),
    );
  }
}
