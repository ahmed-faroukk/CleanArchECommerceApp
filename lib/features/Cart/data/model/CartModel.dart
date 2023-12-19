
import 'package:ecommerce_clean_arch/features/Cart/domin/entities/CartItem.dart';
import 'package:ecommerce_clean_arch/features/shop/data/model/ProductModel.dart';
import 'package:ecommerce_clean_arch/features/shop/domin/Entitiy/Product.dart';

class CartItemModel extends CartItemEntity {

  CartItemModel({
    required ProductModel product ,
    required int quantity
}) : super(product: product , quantity: quantity);




}
