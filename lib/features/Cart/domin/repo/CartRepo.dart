import '../../../shop/domin/Entitiy/Product.dart';
import '../entities/CartItem.dart';

abstract class CartRepository {

  void addToCart( ProductsEntity product , List<CartItemEntity> _shoppingCart );
  void removeFromCart(String productId , List<CartItemEntity> _shoppingCart);
  void incrementQty(String productId , List<CartItemEntity> _shoppingCart);
  void decrementQty(String productId , List<CartItemEntity> _shoppingCart);
  double getCartTotal(List<CartItemEntity> _shoppingCart);
  int getCartSize(List<CartItemEntity> _shoppingCart);

}