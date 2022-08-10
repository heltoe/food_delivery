import 'package:food_delivery/data/repository/recommended_product_controller.dart';
import 'package:food_delivery/models/recommended/product_list_recommended.dart';
import 'package:food_delivery/models/recommended/product_recommended.dart';
import 'package:get/get.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepository recommendedProductRepository;
  List<ProductRecommended> _recommendedProducts = [];

  List<ProductRecommended> get recommendedProductList => _recommendedProducts;
  bool _isLoading = true;
  bool get isLoading => _isLoading;

  RecommendedProductController({ required this.recommendedProductRepository });

  Future<void> getRecommendedProductList() async {
    _isLoading = true;
    Response response = await recommendedProductRepository.getRecommendedProductList();
    if (response.statusCode == 200) {
      _recommendedProducts = [];
      _recommendedProducts.addAll(ProductListRecommended.fromJson(response.body).products);
      update();
    } else {}
    _isLoading = false;
  }
}