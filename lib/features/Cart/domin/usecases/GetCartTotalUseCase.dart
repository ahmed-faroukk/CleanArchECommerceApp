import 'package:ecommerce_clean_arch/features/Cart/domin/repo/CartRepo.dart';

import '../../../../core/usecase/AbstractUseCase.dart';
import '../../../shop/domin/Entitiy/Product.dart';
import '../entities/CartItem.dart';

class GetCartTotalUseCase {
  final CartRepository repo;

  GetCartTotalUseCase(this.repo);

  void invoke({required GetCartTotalParams params}) {
    repo.getCartTotal(params.shoppingCart);
  }
}

class GetCartTotalParams {
  final List<CartItemEntity> shoppingCart;

  GetCartTotalParams({
    required this.shoppingCart,
  });
}
