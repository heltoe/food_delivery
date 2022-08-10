import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/models/popular/product_popular.dart';
import 'package:food_delivery/pages/home/components/main_food_slider/image_slide.dart';
import 'package:food_delivery/pages/home/components/main_food_slider/white_description_slide.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';

class MainFoodSlider extends StatefulWidget {
  const MainFoodSlider({
    Key? key,
    required this.productList,
  }) : super(key: key);
  final List<ProductPopular> productList;

  @override
  State<MainFoodSlider> createState() => _MainFoodSliderState();
}

class _MainFoodSliderState extends State<MainFoodSlider> {
  PageController pageController = PageController(viewportFraction: 0.85);
  double _currentPage = 0.0;
  final double _scaleFactor = 0.8;
  final double _baseHeight = Dimensions.pageViewContainerHeight;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPage = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  Widget _buildPageItem(ProductPopular card, int index) {
    Matrix4 matrix4 = Matrix4.identity();
    double currentScale = 0.0;
    if (index == _currentPage.floor() || index == _currentPage.floor() - 1) {
      currentScale = 1 - (_currentPage - index) * (1 - _scaleFactor);
    } else if (index == _currentPage.floor() + 1) {
      currentScale =
          _scaleFactor + (_currentPage - index + 1) * (1 - _scaleFactor);
    } else {
      currentScale = 0.8;
    }
    double currentTransformation = _baseHeight * (1 - currentScale) / 2;
    matrix4 = Matrix4.diagonal3Values(1, currentScale, 1)
      ..setTranslationRaw(0, currentTransformation, 0);

    return Transform(
      transform: matrix4,
      child: Stack(
        children: [
          ImageSlide(
            baseHeight: _baseHeight,
            image: card.img!,
            index: index,
          ),
          WhiteDescriptionSlide(title: card.name!, stars: card.stars!.toDouble(),),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: Dimensions.pageViewHeight,
          child: PageView.builder(
            controller: pageController,
            itemCount: widget.productList.length,
            itemBuilder: (_, index) {
              return _buildPageItem(widget.productList[index], index);
            },
          ),
        ),
        DotsIndicator(
          dotsCount: widget.productList.isEmpty ? 1 : widget.productList.length,
          position: _currentPage,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
      ],
    );
  }
}
