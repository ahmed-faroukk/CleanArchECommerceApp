import 'package:ecommerce_clean_arch/features/Cart/domin/repo/CartRepo.dart';

import '../../../../core/usecase/AbstractUseCase.dart';
import '../../../shop/domin/Entitiy/Product.dart';
import '../entities/CartItem.dart';

class DecrementQtyUseCase {
  final CartRepository repo;

  DecrementQtyUseCase(this.repo);

  void invoke({required DecrementQtyParams params}) {
    repo.decrementQty(params.productId, params.shoppingCart);
  }
}

class DecrementQtyParams {
  final String productId;
  final List<CartItemEntity> shoppingCart;

  DecrementQtyParams({
    required this.productId,
    required this.shoppingCart,
  });
}
