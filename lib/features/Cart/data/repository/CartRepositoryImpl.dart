import 'package:ecommerce_clean_arch/features/Cart/domin/entities/CartItem.dart';
import 'package:ecommerce_clean_arch/features/Cart/domin/repo/CartRepo.dart';

import '../../../shop/domin/Entitiy/Product.dart';

class CartRepositoryImpl extends CartRepository {

  @override
  void addToCart(ProductsEntity product, List<CartItemEntity> _shoppingCart) {
    var isExist = _shoppingCart.where((element) => element.product.title == product.title);
    if (isExist.isEmpty) {
      _shoppingCart.add(CartItemEntity(
        product: product,
        quantity: 1,
      ));
    } else {
      isExist.first.quantity += 1;
    }
  }

  @override
  void decrementQty(String productId, List<CartItemEntity> _shoppingCart) {
    CartItemEntity item = _shoppingCart.where((element) => element.product.title == productId).first;
    if(item.quantity>1){
      item.quantity-- ;
    }else{
      removeFromCart(productId, _shoppingCart);
    }
  }

  @override
  int getCartSize(List<CartItemEntity> _shoppingCart) {
    return _shoppingCart.length;
  }

  @override
  double getCartTotal(List<CartItemEntity> _shoppingCart) {
    var total = 0.0 ;
    for(var cartItem in _shoppingCart){
      var newPrice = double.parse(cartItem.product.price);
      total += newPrice  * (cartItem.quantity);
    }
    return total ;
  }

  @override
  void incrementQty(String productId, List<CartItemEntity> _shoppingCart) {
    CartItemEntity item = _shoppingCart.where((element) => element.product.title == productId).first;
      item.quantity++ ;

  }

  @override
  void removeFromCart(String productId, List<CartItemEntity> _shoppingCart) {
    _shoppingCart.removeWhere((element) => element.product.title == productId);
  }

}