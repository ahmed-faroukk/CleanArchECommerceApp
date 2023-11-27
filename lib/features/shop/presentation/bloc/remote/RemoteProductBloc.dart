import 'package:ecommerce_clean_arch/features/shop/domin/usecase%20/GetAllProductsUseCase.dart';
import 'package:ecommerce_clean_arch/features/shop/domin/usecase%20/GetElectronicsProductsUseCase.dart';
import 'package:ecommerce_clean_arch/features/shop/domin/usecase%20/GetJeweleryProductsUseCase.dart';
import 'package:ecommerce_clean_arch/features/shop/domin/usecase%20/GetMenProductsUseCase.dart';
import 'package:ecommerce_clean_arch/features/shop/domin/usecase%20/GetWomensProductsUseCase.dart';
import 'package:ecommerce_clean_arch/features/shop/presentation/bloc/remote/RemoteProductEvent.dart';
import 'package:ecommerce_clean_arch/features/shop/presentation/bloc/remote/RemoteProductState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/resources/Resources.dart';

class RemoteProductBloc extends Bloc<RemoteProductEvent, RemoteProductState> {
  final GetAllProductsUseCase getAllProductsUseCase;

  final GetMensProductsUseCase getMensProductsUseCase;

  final GetWomensProductsUseCase getWomensProductsUseCase;

  final GetElectronicsProductsUseCase getElectronicsProductsUseCase;

  final GetJeweleryProductsUseCase getJeweleryProductsUseCase;

  RemoteProductBloc(
      this.getAllProductsUseCase,
      this.getMensProductsUseCase,
      this.getWomensProductsUseCase,
      this.getElectronicsProductsUseCase,
      this.getJeweleryProductsUseCase)
      : super(const RemoteProductLoading()) {
    on<GetAllProducts>(onGetAllProducts);
    on<GetMenProducts>(onGetMensProducts);
    on<GetWomenProducts>(onGetWomensProducts);
    on<GetElectronicsProducts>(onGetElectronicsProducts);
    on<GetJeweleryProducts>(onGetJeweleryProducts);
  }

  void onGetAllProducts(
      GetAllProducts event, Emitter<RemoteProductState> emit) async {
    final dataState = await getAllProductsUseCase.invoke();
    if (dataState is Success && dataState.data!.isNotEmpty) {
      emit(RemoteProductDone(dataState.data!));
    }
    if (dataState is Error) {
      emit(RemoteProductError(dataState.error!));
    }
  }

  void onGetMensProducts(
      GetMenProducts event, Emitter<RemoteProductState> emit) async {
    final dataState = await getMensProductsUseCase.invoke();
    if (dataState is Success && dataState.data!.isNotEmpty) {
      emit(RemoteProductDone(dataState.data!));
    }
    if (dataState is Error) {
      emit(RemoteProductError(dataState.error!));
    }
  }

  void onGetWomensProducts(
      GetWomenProducts event, Emitter<RemoteProductState> emit) async {
    final dataState = await getWomensProductsUseCase.invoke();
    if (dataState is Success && dataState.data!.isNotEmpty) {
      emit(RemoteProductDone(dataState.data!));
    }
    if (dataState is Error) {
      emit(RemoteProductError(dataState.error!));
    }
  }

  void onGetElectronicsProducts(
      GetElectronicsProducts event, Emitter<RemoteProductState> emit) async {
    final dataState = await getElectronicsProductsUseCase.invoke();
    if (dataState is Success && dataState.data!.isNotEmpty) {
      emit(RemoteProductDone(dataState.data!));
    }
    if (dataState is Error) {
      emit(RemoteProductError(dataState.error!));
    }
  }

  void onGetJeweleryProducts(
      GetJeweleryProducts event, Emitter<RemoteProductState> emit) async {
    final dataState = await getJeweleryProductsUseCase.invoke();
    if (dataState is Success && dataState.data!.isNotEmpty) {
      emit(RemoteProductDone(dataState.data!));
    }
    if (dataState is Error) {
      emit(RemoteProductError(dataState.error!));
    }
  }
}
