import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/data/repository/popular_product_repository.dart';
import 'package:food_delivery/models/cart_item.dart';
import 'package:food_delivery/models/popular/product_popular.dart';
import 'package:food_delivery/models/popular/product_list_popular.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class PopularProductController extends GetxController {
  final PopularProductRepository popularProductRepository;
  late CartController _cartController;
  List<ProductPopular> _popularProducts = [];

  List<ProductPopular> get popularProductList => _popularProducts;
  bool _isLoading = true;

  bool get isLoading => _isLoading;
  int _quantity = 0;

  int get quantity => _quantity;

  int _inCartItems = 0;

  int get inCartItems => _inCartItems;

  final int _maxCount = 20;

  PopularProductController({required this.popularProductRepository});

  Future<void> getPopularProductList() async {
    _isLoading = true;
    Response response = await popularProductRepository.getPopularProductList();
    if (response.statusCode == 200) {
      _popularProducts = [];
      _popularProducts
          .addAll(ProductListPopular.fromJson(response.body).products);
    } else {}
    _isLoading = false;
    update();
  }

  void initProduct(ProductPopular productPopular, CartController cartController) {
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

  void cartHandler(ProductPopular productPopular) {
    CartItem cartItem = _getFormattedCartItem(productPopular);
    _cartController.changeQuantity(cartItem);
    _setCardCounter();
    update();
  }

  void _setCardCounter() {
    _inCartItems = _cartController.items.length;
  }

  void _initProductQuantity(ProductPopular productPopular) {
    CartItem cartItem = _getFormattedCartItem(productPopular);
    if (_cartController.isExistInCart(cartItem)) {
      _quantity = _cartController.items[cartItem.id]!.quantity!;
    } else {
      _quantity = 0;
    }
  }

  CartItem _getFormattedCartItem(ProductPopular productPopular) {
    CartItem cartItem = CartItem(
      id: productPopular.id,
      name: productPopular.name,
      price: productPopular.price,
      img: productPopular.img,
      quantity: _quantity,
      isExist: true,
      time: DateTime.now().toString(),
      isPopular: true,
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
