import 'package:ecommerce_clean_arch/features/shop/data/model/ProductModel.dart';
import 'package:ecommerce_clean_arch/features/shop/domin/Entitiy/Product.dart';

class CartItemEntity {
  final ProductsEntity product;
  int quantity;
  CartItemEntity({required this.product, this.quantity = 1});
}
