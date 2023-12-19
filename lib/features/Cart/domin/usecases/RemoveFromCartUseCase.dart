import 'package:ecommerce_clean_arch/features/Cart/domin/repo/CartRepo.dart';

import '../../../../core/usecase/AbstractUseCase.dart';
import '../../../shop/domin/Entitiy/Product.dart';
import '../entities/CartItem.dart';

class RemoveFromCartUseCase {
  final CartRepository repo;

  RemoveFromCartUseCase(this.repo);

  void invoke({required RemoveFromCartParams params}) {
    repo.removeFromCart(params.productId, params.shoppingCart);
  }
}

class RemoveFromCartParams {
  final String productId;
  final List<CartItemEntity> shoppingCart;

  RemoveFromCartParams({
    required this.productId,
    required this.shoppingCart,
  });
}
