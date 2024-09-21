import 'package:alisons_flutter_test/model/product_model.dart';
import 'package:alisons_flutter_test/services/api_services.dart';
import 'package:get/get.dart';


class ProductController extends GetxController {
  final ApiServices _apiServices ;
  
  var products = <Product>[].obs;
  var isLoading = true.obs;

  ProductController(this._apiServices);

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  Future<void> fetchProducts() async {
    try {
      isLoading(true);
      final fetchedProducts = await _apiServices.fetchProducts();
      products.assignAll(fetchedProducts);
    } catch (error) {
      print('Error fetching products: $error');
 
    } finally {
      isLoading(false);
    }
  }
}