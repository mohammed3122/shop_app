import 'package:shop_app/helper/api.dart';
import 'package:shop_app/models/product_model.dart';

class GetAllProductsServices {
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> jsonData = await Api().get(
      url: 'https://fakestoreapi.com/products',
    );
    List<ProductModel> productsList = [];
    for (int i = 0; i < jsonData.length; i++) {
      productsList.add(ProductModel.fromJson(jsonData[i]));
    }
    return productsList;
  }
}
