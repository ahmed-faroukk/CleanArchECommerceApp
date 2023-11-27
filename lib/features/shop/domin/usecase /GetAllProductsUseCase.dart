import 'package:ecommerce_clean_arch/features/shop/domin/Entitiy/Product.dart';
import 'package:ecommerce_clean_arch/features/shop/domin/repository/ShopRepo.dart';

import '../../../../core/resources/Resources.dart';
import '../../../../core/usecase/AbstractUseCase.dart';

class GetAllProductsUseCase implements  UseCase<Resource<List<ProductsEntity>>, void>  {
  final ShopRepo repo;
  GetAllProductsUseCase(this.repo);


  @override
  Future<Resource<List<ProductsEntity>>> invoke({void params}) {
    return repo.getAllProducts();
  }

}

