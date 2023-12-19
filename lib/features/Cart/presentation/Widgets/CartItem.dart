import 'package:ecommerce_clean_arch/features/Cart/domin/entities/CartItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ecommerce_clean_arch/features/Cart/data/model/CartModel.dart';
import '../ViewModel/CartViewModel.dart';

class CartItem extends StatefulWidget {
  final CartItemEntity cartItem;

  const CartItem({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildImageContainer(),
          _buildItemDetailsColumn(),
          _buildRemoveItemButton(),
        ],
      ),
    );
  }

  Widget _buildImageContainer() {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.30,
      height: size.height * 0.13,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Center(
        child: Image.network(
          widget.cartItem.product.image,
          width: 70,
          height: 70,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _buildItemDetailsColumn() {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * 0.45,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(),
          SizedBox(height: size.height * 0.005),
          _buildPrice(),
          SizedBox(height: size.width * 0.030),
          _buildQuantityRow(),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    Size size = MediaQuery.of(context).size;

    return Text(
      widget.cartItem.product.title,
      style: GoogleFonts.poppins(
        fontSize: size.width * 0.035,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildPrice() {
    Size size = MediaQuery.of(context).size;

    return Text(
      "\$${widget.cartItem.product.price}",
      style: GoogleFonts.poppins(
        color: Colors.black.withOpacity(0.8),
        fontSize: size.width * 0.035,
      ),
    );
  }

  Widget _buildQuantityRow() {
    return Row(
      children: [
        _buildQuantityButton(Iconsax.add, () {
          context.read<CartViewModel>().incrementQty(widget.cartItem.product.title.toString());
        }),
        SizedBox(width: 13),
        Text(
          widget.cartItem.quantity.toString(),
          style: GoogleFonts.poppins(),
        ),
        SizedBox(width: 13),
        _buildQuantityButton(Iconsax.minus, () {
          setState(() {
            context.read<CartViewModel>()
                .decrementQty(widget.cartItem.product.title.toString());

          });
        }),
      ],
    );
  }

  Widget _buildQuantityButton(IconData icon, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black26),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Icon(icon, color: Colors.black, size: 14),
      ),
    );
  }

  Widget _buildRemoveItemButton() {
    return GestureDetector(
      onTap: () {
        context.read<CartViewModel>().removeItem(widget.cartItem.product.title.toString());
        _showRemoveItemSnackBar();
      },
      child: CircleAvatar(
        backgroundColor: Colors.redAccent.withOpacity(0.07),
        radius: 18,
        child: const Icon(
          Iconsax.trash,
          color: Colors.redAccent,
          size: 14,
        ),
      ),
    );
  }

  void _showRemoveItemSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Color.fromARGB(255, 247, 247, 247),
        content: Text(
          "Item removed!",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
