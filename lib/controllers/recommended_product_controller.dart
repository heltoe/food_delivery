import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/data/repository/recommended_product_controller.dart';
import 'package:food_delivery/models/cart_item.dart';
import 'package:food_delivery/models/recommended/product_list_recommended.dart';
import 'package:food_delivery/models/recommended/product_recommended.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:get/get.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepository recommendedProductRepository;
  late CartController _cartController;
  List<ProductRecommended> _recommendedProducts = [];

  List<ProductRecommended> get recommendedProductList => _recommendedProducts;
  bool _isLoading = true;

  bool get isLoading => _isLoading;
  int _quantity = 0;

  int get quantity => _quantity;

  int _inCartItems = 0;

  int get inCartItems => _inCartItems;

  final int _maxCount = 20;

  RecommendedProductController({required this.recommendedProductRepository});

  Future<void> getRecommendedProductList() async {
    _isLoading = true;
    Response response =
        await recommendedProductRepository.getRecommendedProductList();
    if (response.statusCode == 200) {
      _recommendedProducts = [];
      _recommendedProducts
          .addAll(ProductListRecommended.fromJson(response.body).products);
    } else {}
    _isLoading = false;
    update();
  }

  void initProduct(ProductRecommended productPopular, CartController cartController) {
    _cartController = cartController;
    _setCardCounter();
    _initProductQuantity(productPopular);
  }

  void setQuantity(int count) {
    if (count > _maxCount) {
      _callSnackBar("You cant reduce more!");
      return;
    }
    if (count < 0) {
      return;
    }
    _quantity = count;
    update();
  }

  void cartHandler(ProductRecommended productPopular) {
    CartItem cartItem = _getFormattedCartItem(productPopular);
    _cartController.changeQuantity(cartItem);
    _setCardCounter();
    update();
  }

  void _setCardCounter() {
    _inCartItems = _cartController.items.length;
  }

  void _initProductQuantity(ProductRecommended productPopular) {
    CartItem cartItem = _getFormattedCartItem(productPopular);
    if (_cartController.isExistInCart(cartItem)) {
      _quantity = _cartController.items[cartItem.id]!.quantity!;
    } else {
      _quantity = 0;
    }
  }

  CartItem _getFormattedCartItem(ProductRecommended productPopular) {
    CartItem cartItem = CartItem(
      id: productPopular.id,
      name: productPopular.name,
      price: productPopular.price,
      img: productPopular.img,
      quantity: _quantity,
      isExist: true,
      time: DateTime.now().toString(),
    );
    return cartItem;
  }

  void _callSnackBar(String message) {
    Get.snackbar(
      "Item count",
      message,
      backgroundColor: AppColors.mainColor,
      colorText: Colors.white,
    );
  }
}
