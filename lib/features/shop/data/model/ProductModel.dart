import 'package:flutter/cupertino.dart';

import '../../domin/Entitiy/Product.dart';

class ProductModel extends ProductsEntity {
  // Constructor for ProductModel
  const ProductModel({
    int ? id,
    required String title,
    required String price,
    required String category,
    required String description,
    required String image,
  }) : super(
    // Calling the constructor of the superclass (ProductsEntity)
    id: id,
    title: title,
    price: price,
    category: category,
    description: description,
    image: image,
  );

  // get product from json
  factory ProductModel.fromJson(Map<String, dynamic> map) {
    return ProductModel(
      title: map['title'] ?? "",
      // Convert 'price' to a numeric type, assuming it's a number
      price: (map['price'] as num?)?.toString() ?? "",
      category: map['category'] ?? "",
      description: map['description'] ?? "",
      image: map['image'] ?? "",
    );
  }


}
