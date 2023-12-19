import 'package:ecommerce_clean_arch/features/Cart/domin/repo/CartRepo.dart';

import '../../../../core/usecase/AbstractUseCase.dart';
import '../../../shop/domin/Entitiy/Product.dart';
import '../entities/CartItem.dart';

class GetCartSizeUseCase {
  final CartRepository repo;

  GetCartSizeUseCase(this.repo);

  void invoke({required GetCartSizeParams params}) {
    repo.getCartSize(params.shoppingCart);
  }
}

class GetCartSizeParams {
  final List<CartItemEntity> shoppingCart;

  GetCartSizeParams({
    required this.shoppingCart,
  });
}
