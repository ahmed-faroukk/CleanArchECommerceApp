import 'package:ecommerce_clean_arch/di.dart';
import 'package:ecommerce_clean_arch/features/shop/domin/Entitiy/Product.dart';
import 'package:ecommerce_clean_arch/features/shop/presentation/bloc/remote/RemoteProductEvent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/remote/RemoteProductBloc.dart';
import '../bloc/remote/RemoteProductState.dart';
import '../widgets/ProductItem.dart';

class JeweleryScreen extends StatefulWidget {
  const JeweleryScreen({Key? key}) : super(key: key);

  @override
  State<JeweleryScreen> createState() => _JeweleryScreenState();
}

class _JeweleryScreenState extends State<JeweleryScreen> {
  @override
  Widget build(BuildContext context) {
    return buildPopularScreen();
  }

  Widget buildPopularScreen() {
    return BlocProvider<RemoteProductBloc>(
      create: (context) => s1()..add(const GetJeweleryProducts()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: _buildBody(),
      ),
    );
  }
  _buildBody() {
    return BlocBuilder<RemoteProductBloc, RemoteProductState>(
      builder: (_, state) {
        if (state is RemoteProductLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is RemoteProductError) {
          return const Center(child: Icon(Icons.refresh));
        }
        if (state is RemoteProductDone) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Set the number of columns
              crossAxisSpacing: 8.0, // Set spacing between columns
              mainAxisSpacing: 8.0, // Set spacing between rows
            ),
            itemBuilder: (context, index) {
              return ProductWidget(
                product: state.product![index],
                onProductPressed: (article) => _onProductPressed(state.product![index]),
              );
            },
            itemCount: state.product!.length,
          );

        }

        return const SizedBox();
      },
    );
  }



  _onProductPressed( ProductsEntity product) {
    // Make sure to set up the corresponding route in your app
    Navigator.pushNamed(context, '/ProductDetails', arguments: product);
  }
}
