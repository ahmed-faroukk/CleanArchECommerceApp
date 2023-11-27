import 'package:ecommerce_clean_arch/core/constants/Constants.dart';
import 'package:ecommerce_clean_arch/features/shop/data/model/ProductModel.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'ShopApiService.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class ShopApiService {
  factory ShopApiService(Dio dio) = _ShopApiService;

  @GET("/products")
  Future<HttpResponse<List<ProductModel>>> getAllProducts();

  @GET("/products/category/{category}")
  Future<HttpResponse<List<ProductModel>>> getProductsByCategory(@Path("category") String category);


}