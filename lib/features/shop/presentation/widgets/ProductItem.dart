import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_clean_arch/features/shop/data/model/ProductModel.dart';
import 'package:ecommerce_clean_arch/features/shop/domin/Entitiy/Product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  final ProductsEntity product;
  final void Function(ProductsEntity product)? onProductPressed;

  const ProductWidget({
    Key? key,
    required this.product,
    this.onProductPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Hero(
        tag: "Product_${product.image}",
        child: Material(
          color: Colors.transparent,
          child: Expanded(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              elevation: 10.0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 5,),
                    _buildImage(),
                    _buildProductInfo(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Expanded(
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
        child: CachedNetworkImage(
          imageUrl: product.image,
          fit: BoxFit.scaleDown,
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }

  Widget _buildProductInfo() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Price: \$${product.price}",
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              _buildRating(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRating() {
    return const Row(
      children: [
        Icon(
          Icons.star,
          color: Colors.amber,
          size: 18,
        ),
        Text(
          "4.0", // Replace with actual rating
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }
  
  onTab() {
    if (onProductPressed != null) {
      onProductPressed!(product);
    }
  }
}
