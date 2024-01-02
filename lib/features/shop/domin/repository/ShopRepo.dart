import 'dart:io';

import 'package:ecommerce_clean_arch/core/resources/Resources.dart';
import 'package:ecommerce_clean_arch/features/shop/domin/Entitiy/Product.dart';

import '../../data/model/ProductModel.dart';

abstract class ShopRepo {

  Future<Resource<List<ProductsEntity>>> getAllProducts();
  Future<Resource<List<ProductsEntity>>> getProductsByCategory(String category);

}