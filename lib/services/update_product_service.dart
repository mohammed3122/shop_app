import 'dart:developer';

import 'package:shop_app/helper/api.dart';

class UpdateProductService {
  Future<Map<String, dynamic>> updateProduct({
    required dynamic id,
    required String productName,
    required dynamic productPrice,
    required String productDesc,
    required String productCategory,
  }) async {
    Map<String, dynamic> productUpdated = await Api().update(
      url: 'https://fakestoreapi.com/products/$id',
      productName: productName,
      productPrice: productPrice,
      productDesc: productDesc,
      productCategory: productCategory,
    );
    log(productUpdated.toString());
    return productUpdated;
  }
}
