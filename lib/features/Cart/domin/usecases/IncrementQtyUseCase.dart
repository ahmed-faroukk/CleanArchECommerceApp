import 'package:ecommerce_clean_arch/features/Cart/domin/repo/CartRepo.dart';

import '../../../../core/usecase/AbstractUseCase.dart';
import '../../../shop/domin/Entitiy/Product.dart';
import '../entities/CartItem.dart';

class IncrementQtyUseCase {
  final CartRepository repo;

  IncrementQtyUseCase(this.repo);

  void invoke({required IncrementQtyParams params}) {
    repo.incrementQty(params.productId, params.shoppingCart);
  }
}

class IncrementQtyParams {
  final String productId;
  final List<CartItemEntity> shoppingCart;

  IncrementQtyParams({
    required this.productId,
    required this.shoppingCart,
  });
}
