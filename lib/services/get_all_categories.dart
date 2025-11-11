import 'package:shop_app/helper/api.dart';

class GetAllCategories {
  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> categories = await Api().get(
      //jsonData
      url: 'https://fakestoreapi.com/products/categories',
    );
    return categories;
  }
}
