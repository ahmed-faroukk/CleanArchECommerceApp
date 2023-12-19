import 'package:ecommerce_clean_arch/features/Cart/domin/repo/CartRepo.dart';

import '../../../../core/usecase/AbstractUseCase.dart';
import '../../../shop/domin/Entitiy/Product.dart';
import '../entities/CartItem.dart';

class AddToCartUseCase {
  final CartRepository repo;

  AddToCartUseCase(this.repo);

  void invoke({required AddToCartParams params}) {
    repo.addToCart(params.product, params.shoppingCart);
  }
}

class AddToCartParams {
  final ProductsEntity product;
  final List<CartItemEntity> shoppingCart;

  AddToCartParams({
    required this.product,
    required this.shoppingCart,
  });
}
