import 'package:ecommerce_clean_arch/features/shop/domin/Entitiy/Product.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';

abstract class RemoteProductState extends Equatable {

  final List<ProductsEntity> ? product ;
  final DioError ? error ;

  const RemoteProductState({this.product , this.error});

  @override
  List<Object> get props {
    return [product! , error!];
  }

}

class RemoteProductLoading extends RemoteProductState{
  const RemoteProductLoading();
}

class RemoteProductDone extends RemoteProductState{
  const RemoteProductDone(List<ProductsEntity> product) : super(product: product);
}

class RemoteProductError extends RemoteProductState{
  const RemoteProductError(DioError  error ) : super(error: error);
}