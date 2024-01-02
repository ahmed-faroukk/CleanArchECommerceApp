
import 'dart:io';

import 'package:ecommerce_clean_arch/core/resources/Resources.dart';
import 'package:ecommerce_clean_arch/features/shop/data/dataSource/remote/ShopApiService.dart';
import 'package:ecommerce_clean_arch/features/shop/domin/Entitiy/Product.dart';
import 'package:ecommerce_clean_arch/features/shop/domin/repository/ShopRepo.dart';
import 'package:dio/dio.dart';


class ShopRepoImpl extends ShopRepo {
  final ShopApiService shopApiService;

  ShopRepoImpl(this.shopApiService);

  @override
  Future<Resource<List<ProductsEntity>>> getAllProducts() async {
    final response = await shopApiService.getAllProducts();
    try {
      if (response.response.statusCode == HttpStatus.ok) {
        return Success(response.data);
      } else {
        return Error(DioError(
            error: response.response.statusMessage,
            response: response.response,
            type: DioErrorType.response,
            requestOptions: response.response.requestOptions));
      }
    } on DioError catch (e) {
      return Error(e);
    }
  }

  @override
  Future<Resource<List<ProductsEntity>>> getProductsByCategory(
      String category) async {
    final response = await shopApiService.getProductsByCategory(category);
    try {
      if (response.response.statusCode == HttpStatus.ok) {
        return Success(response.data);
      } else {
        return Error(DioError(
            error: response.response.statusMessage,
            response: response.response,
            type: DioErrorType.response,
            requestOptions: response.response.requestOptions));
      }
    } on DioError catch (e) {
      return Error(e);
    }
  }
}
