import 'dart:developer';

import 'package:shop_app/helper/api.dart';
import 'package:shop_app/models/product_model.dart';

class GetProductOfCategories {
  Future<List<ProductModel>> getProductOfCategories({
    required String categoryName,
  }) async {
    List<dynamic> jsonData = await Api().get(
      url: 'https://fakestoreapi.com/products/category/$categoryName',
    );

    List<ProductModel> productsOfCategories = [];
    for (int i = 0; i < jsonData.length; i++) {
      productsOfCategories.add(ProductModel.fromJson(jsonData[i]));
    }
    log('$productsOfCategories');
    return productsOfCategories;
  }
}
