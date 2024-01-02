import 'package:ecommerce_clean_arch/features/Cart/data/repository/CartRepositoryImpl.dart';
import 'package:ecommerce_clean_arch/features/Cart/domin/repo/CartRepo.dart';
import 'package:ecommerce_clean_arch/features/Cart/domin/usecases/AddToCart.dart';
import 'package:ecommerce_clean_arch/features/Cart/domin/usecases/CartUseCases/CartUseCases.dart';
import 'package:ecommerce_clean_arch/features/Cart/domin/usecases/GetCartSizeUseCase.dart';
import 'package:ecommerce_clean_arch/features/Cart/domin/usecases/GetCartTotalUseCase.dart';
import 'package:ecommerce_clean_arch/features/Cart/domin/usecases/IncrementQtyUseCase.dart';
import 'package:ecommerce_clean_arch/features/Cart/domin/usecases/RemoveFromCartUseCase.dart';
import 'package:ecommerce_clean_arch/features/Cart/domin/usecases/decrementQtyUseCase.dart';
import 'package:ecommerce_clean_arch/features/Cart/presentation/ViewModel/CartViewModel.dart';
import 'package:ecommerce_clean_arch/features/shop/data/dataSource/remote/ShopApiService.dart';
import 'package:ecommerce_clean_arch/features/shop/data/repository/ShopRepoImpl.dart';
import 'package:ecommerce_clean_arch/features/shop/domin/repository/ShopRepo.dart';
import 'package:ecommerce_clean_arch/features/shop/domin/usecase%20/GetAllProductsUseCase.dart';
import 'package:ecommerce_clean_arch/features/shop/domin/usecase%20/GetElectronicsProductsUseCase.dart';
import 'package:ecommerce_clean_arch/features/shop/domin/usecase%20/GetJeweleryProductsUseCase.dart';
import 'package:ecommerce_clean_arch/features/shop/domin/usecase%20/GetMenProductsUseCase.dart';
import 'package:ecommerce_clean_arch/features/shop/domin/usecase%20/GetWomensProductsUseCase.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'comfig/controller/NetworkController.dart';
import 'features/shop/presentation/bloc/remote/RemoteProductBloc.dart';

final s1 = GetIt.instance;

Future<void> initializeAppDependencies() async {
  initializeShopDependencies();
  initializeCartDependencies();
}


Future<void> initializeShopDependencies() async {
  // dio
  s1.registerSingleton(Dio());
  s1.registerSingleton(ShopApiService(s1()));

  // inject api services into repo
  s1.registerSingleton<ShopRepo>(ShopRepoImpl(s1()));

  // inject repo into  use cases
  s1.registerSingleton(GetAllProductsUseCase(s1()));
  s1.registerSingleton(GetElectronicsProductsUseCase(s1()));
  s1.registerSingleton(GetJeweleryProductsUseCase(s1()));
  s1.registerSingleton(GetMensProductsUseCase(s1()));
  s1.registerSingleton(GetWomensProductsUseCase(s1()));
  // inject use case into bloc
  s1.registerFactory<RemoteProductBloc>(
      () => RemoteProductBloc(s1(), s1(), s1(), s1(), s1()));
}

Future<void> initializeCartDependencies() async {
  // inject api services into repo
  s1.registerSingleton<CartRepository>(CartRepositoryImpl());
  // inject repo into  use cases
  s1.registerSingleton(CartUseCases(
      addToCartUseCase: AddToCartUseCase(s1()),
      decrementQtyUseCase: DecrementQtyUseCase(s1()),
      incrementQtyUseCase: IncrementQtyUseCase(s1()),
      removeFromCartUseCase: RemoveFromCartUseCase(s1()),
      getCartSizeUseCase: GetCartSizeUseCase(s1()),
      getCartTotalUseCase: GetCartTotalUseCase(s1())));

  // inject use case into ViewModel
  s1.registerSingleton<CartViewModel>(CartViewModel(cartUseCases: s1()));
}

class ControllerInit {
  static void init() {
    Get.put<NetworkController>(NetworkController(), permanent: true);
  }
}
