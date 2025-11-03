class ProductModel {
  final String productName;
  final dynamic productPrice;
  final String desc;
  final String category;
  final String image;
  // final Rating? rating;

  ProductModel({
    required this.productName,
    required this.productPrice,
    required this.desc,
    required this.category,
    required this.image,
    // required this.rating,
  });

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      productName: jsonData['title'],
      productPrice: jsonData['price'],
      desc: jsonData['description'],
      category: jsonData['category'],
      image: jsonData['image'],
      // rating: Rating.fromJson(jsonData['rating']),
    );
  }
}

class Rating {
  final double rate;
  final int count;

  Rating({required this.rate, required this.count});

  factory Rating.fromJson(jsonData) {
    return Rating(rate: jsonData['rate'], count: jsonData['count']);
  }
}
