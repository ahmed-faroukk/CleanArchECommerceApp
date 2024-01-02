import 'dart:ffi';

import 'package:ecommerce_clean_arch/features/Cart/domin/entities/CartItem.dart';
import 'package:ecommerce_clean_arch/features/Cart/domin/usecases/AddToCart.dart';
import 'package:ecommerce_clean_arch/features/Cart/domin/usecases/CartUseCases/CartUseCases.dart';
import 'package:ecommerce_clean_arch/features/shop/domin/Entitiy/Product.dart';
import 'package:flutter/material.dart';

class CartViewModel extends ChangeNotifier {
  final CartUseCases cartUseCases;

  CartViewModel({required this.cartUseCases});

  final List<CartItemEntity> _shoppingCart = [];

// Factory method to create the provider with the use cases

  void addToCart(ProductsEntity product) {
    cartUseCases.addToCartUseCase.invoke(
        params: AddToCartParams(product: product, shoppingCart: shoppingCart));
    notifyListeners();
  }

  void removeItem(String productTitle) {
    _shoppingCart
        .removeWhere((element) => element.product.title == productTitle);
    notifyListeners();
  }

  void incrementQty(String productTitle) {
    CartItemEntity item = _shoppingCart
        .where((element) => element.product.title == productTitle)
        .first;
    item.quantity++;
    notifyListeners();
  }

  void decrementQty(String productTitle) {
    CartItemEntity item = _shoppingCart
        .where((element) => element.product.title == productTitle)
        .first;

    if (item.quantity > 1) {
      item.quantity--;
    } else {
      _shoppingCart.remove(item);
    }
    notifyListeners();
  }

  double getCartTotal() {
    double total = 0;
    for (var cartItem in _shoppingCart) {
      var newPrice = double.parse(cartItem.product.price);
      total += newPrice * (cartItem.quantity);
    }
    return total;
  }

   getCartSize()  {
    return shoppingCart.length;
  }

  List<CartItemEntity> get shoppingCart => _shoppingCart;

  double get cartSubTotal => getCartTotal();

  double get shippingCharge => 120;

  double get cartTotal => cartSubTotal + shippingCharge;
}
