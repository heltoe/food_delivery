import 'package:food_delivery/data/repository/popular_product_repository.dart';
import 'package:food_delivery/models/popular/product_popular.dart';
import 'package:food_delivery/models/popular/product_list_popular.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepository popularProductRepository;
  List<ProductPopular> _popularProducts = [];

  List<ProductPopular> get popularProductList => _popularProducts;
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  PopularProductController({required this.popularProductRepository});

  Future<void> getPopularProductList() async {
    _isLoading = true;
    Response response = await popularProductRepository.getPopularProductList();
    if (response.statusCode == 200) {
      _popularProducts = [];
      _popularProducts.addAll(ProductListPopular.fromJson(response.body).products);
      update();
    } else {}
    _isLoading = false;
  }
}
