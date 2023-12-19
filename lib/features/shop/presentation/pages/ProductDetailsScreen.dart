import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_clean_arch/features/Cart/domin/entities/CartItem.dart';
import 'package:ecommerce_clean_arch/features/shop/data/model/ProductModel.dart';
import 'package:ecommerce_clean_arch/features/shop/domin/Entitiy/Product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import '../../../../di.dart';
import '../../../Cart/presentation/ViewModel/CartViewModel.dart';

class ProductDetailWidget extends StatefulWidget {
  final ProductsEntity product;

  const ProductDetailWidget({super.key, required this.product});

  @override
  State createState() => _ProductDetailWidget(product: product);
}

class _ProductDetailWidget extends State<ProductDetailWidget> {
  final ProductsEntity product;
  @override
  void initState() {
    super.initState();
  }

  _ProductDetailWidget({
    required this.product,
  });

  @override
  Widget build(BuildContext context) {

    return MultiProvider(providers: [
    ChangeNotifierProvider<CartViewModel>(
    create: (_) => Get.find<CartViewModel>(), // Access the instance using Get.find
    ),
    ],
        child: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Hero(
      tag: "Product_${product.image}",
      child: ScaffoldMessenger(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  buildProductHeaderStack(context),
                  buildProductDescription(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildProductHeaderStack(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Image
        Container(
          width: double.infinity, // Fill width
          height: 400,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 10,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: buildImage(context),
          ),
        ),
        // Title
        Positioned(
          bottom: 0,
          child: Container(
            height: 400,
            width: MediaQuery.of(context).size.width, // Use the screen width
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.black, Colors.transparent],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20, left: 20),
              // Adjust the padding as needed
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildProductTitle(),
                  // You can add other widgets here like the article subtitle or date
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildProductDescription(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: Expanded(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          product.category,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors
                                .black, // Default to white, but customizable
                          ),
                        ),
                        buildStarRating(rating: 4)
                      ],
                    ),
                  ),
                  Text(
                    "\$" + product.price + ".00 USD",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Default to white, but customizable
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "DESCRIPTION",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color(0xFF6342E8), // Default to white, but customizable
              ),
            ),
            const SizedBox(height: 30),
            Text(
              product.title + product.description,
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w100,
                color: Colors.black, // Default to white, but customizable
              ),
            ),
            const SizedBox(height: 30),
            _buildBButtonRoundedWithBackground(widget.product , context),
            const SizedBox(height: 35),
          ],
        ),
      ),
    );
  }

  Widget _buildProductTitle() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          product.title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white, // White text for contrast
          ),
        ),
        Text(
          "Price : " + product.price,
          textAlign: TextAlign.start,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.green, // White text for contrast
          ),
        ),
      ],
    );
  }

  Widget buildImage(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: product.image,
        imageBuilder: (context, imageProvider) => Padding(
              padding: const EdgeInsetsDirectional.only(end: 14),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.width / 3,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.08),
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
        progressIndicatorBuilder: (context, url, downloadProgress) => Padding(
              padding: const EdgeInsetsDirectional.only(end: 14),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: double.maxFinite,
                  child: const CupertinoActivityIndicator(),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.08),
                  ),
                ),
              ),
            ),
        errorWidget: (context, url, error) => Padding(
              padding: const EdgeInsetsDirectional.only(end: 14),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: double.maxFinite,
                  child: Icon(Icons.image),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.withOpacity(0.1),
                  ),
                ),
              ),
            ));
  }

  Widget buildStarRating({
    required int rating,
    Color starColor = Colors.amber,
    double size = 24.0,
  }) {
    return Row(
      children: List.generate(
        5,
        (index) => Icon(
          index < rating ? Icons.star : Icons.star_border,
          color: starColor,
          size: size,
        ),
      ),
    );
  }

  Widget _buildBButtonRoundedWithBackground(ProductsEntity product , BuildContext context) {
    final CartViewModel cartViewModel = s1<CartViewModel>();

    return ElevatedButton(
      onPressed: () {
        setState(() {
          cartViewModel.addToCart(product);

        });
        _showAddItemSnackBar();
        print("My cart is : " + cartViewModel.getCartSize().toString());
        },
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                12.0), // Adjust the value for the desired roundness
          ),
        ),
        backgroundColor:
            MaterialStateProperty.all<Color>(const Color(0xFF6342E8)),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,
            ),
            Text(
              'ADD To Cart',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _showAddItemSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Color.fromARGB(255, 247, 247, 247),
        content: Text(
          "Item Added!",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}

