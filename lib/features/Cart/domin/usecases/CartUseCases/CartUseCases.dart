import 'package:ecommerce_clean_arch/features/Cart/domin/usecases/AddToCart.dart';
import 'package:ecommerce_clean_arch/features/Cart/domin/usecases/GetCartSizeUseCase.dart';
import 'package:ecommerce_clean_arch/features/Cart/domin/usecases/IncrementQtyUseCase.dart';
import 'package:ecommerce_clean_arch/features/Cart/domin/usecases/RemoveFromCartUseCase.dart';
import 'package:ecommerce_clean_arch/features/Cart/domin/usecases/decrementQtyUseCase.dart';
import 'package:equatable/equatable.dart';

import '../GetCartTotalUseCase.dart';

class CartUseCases extends Equatable {
  final AddToCartUseCase addToCartUseCase;
  final DecrementQtyUseCase decrementQtyUseCase ;
  final IncrementQtyUseCase incrementQtyUseCase ;
  final RemoveFromCartUseCase removeFromCartUseCase ;
  final GetCartSizeUseCase getCartSizeUseCase ;
  final GetCartTotalUseCase getCartTotalUseCase ;

  const CartUseCases({
    required this.addToCartUseCase,
    required this.decrementQtyUseCase,
    required this.incrementQtyUseCase,
    required this.removeFromCartUseCase,
    required this.getCartSizeUseCase,
    required this.getCartTotalUseCase,
  });

  //getter
  @override
  List<Object> get props => [
    addToCartUseCase,
    decrementQtyUseCase,
    incrementQtyUseCase,
    removeFromCartUseCase,
    getCartSizeUseCase,
    getCartTotalUseCase,
  ];
}

