import 'dart:developer';
import 'package:shop_app/helper/api.dart';

class AddProductService {
  Future<Map<String, dynamic>> addProduct({
    required String productName,
    required dynamic productPrice,
    required String? productDesc,
    required String productCategory,
  }) async {
    Map<String, dynamic> productAdded = await Api().add(
      url: 'https://fakestoreapi.com/products',
      productName: productName,
      productPrice: productPrice,
      productDesc: productDesc,
      productCategory: productCategory,
    );
    log('$productAdded');
    return productAdded;
  }
}
