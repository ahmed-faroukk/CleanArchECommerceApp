import 'package:ecommerce_clean_arch/features/Cart/domin/entities/CartItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_clean_arch/features/Cart/presentation/Widgets/CartItem.dart';
import '../../../../di.dart';
import '../../data/model/CartModel.dart';
import '../ViewModel/CartViewModel.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey.shade100,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildOrderDetailsHeader(),
              _buildCartItems(),
              _buildOrderInfo(),
              _buildCheckoutButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrderDetailsHeader() {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.060,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Order Details",
              style: GoogleFonts.poppins(
                fontSize: size.width * 0.040,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartItems() {
    return Expanded(
      child: SizedBox(
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: _buildCartContent(),
        ),
      ),
    );
  }

  Widget _buildCartContent() {
    final CartViewModel cartViewModel = s1<CartViewModel>();

    List<CartItemEntity> shoppingCart = cartViewModel.shoppingCart;

    if (shoppingCart.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCartTitle(),
          _buildCartItemsList(shoppingCart),
        ],
      );
    } else {
      return _buildEmptyCartMessage();
    }
  }

  Widget _buildCartTitle() {
    return Text(
      "My Cart",
      style: GoogleFonts.poppins(
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
    );
  }

  Widget _buildCartItemsList(List<CartItemEntity> shoppingCart) {
    return Consumer<CartViewModel>(
      builder: (context, value, child) => Column(
        children: shoppingCart
            .map(
              (cartItem) => CartItem(
                cartItem: cartItem,
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildEmptyCartMessage() {
    Size size = MediaQuery.of(context).size;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: size.height * 0.25,
          ),
          Icon(
            Iconsax.bag,
            size: size.width * 0.20,
            color: Colors.grey,
          ),
          SizedBox(
            height: size.height * 0.020,
          ),
          Text(
            "Your cart is empty!",
            style: GoogleFonts.poppins(
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildOrderInfo() {
    final CartViewModel cartViewModel = s1<CartViewModel>();

    List<CartItemEntity> shoppingCart = cartViewModel.shoppingCart;

    if (shoppingCart.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Order Info",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: MediaQuery.of(context).size.width * 0.040,
            ),
          ),
          _buildOrderDetails(),
        ],
      );
    } else {
      return Container();
    }
  }

  Widget _buildOrderDetails() {
    final CartViewModel cartViewModel = s1<CartViewModel>();

    Size size = MediaQuery.of(context).size;
    return Consumer<CartViewModel>(
      builder: (context, value, child) => Column(
        children: [
          _buildOrderRow("Sub Total", "\$${cartViewModel.cartSubTotal}"),
          SizedBox(height: size.height * 0.008),
          _buildOrderRow("Shipping", "+\$${cartViewModel.shippingCharge}"),
          SizedBox(height: size.height * 0.015),
          _buildOrderRow(
            "Total",
            "\$${cartViewModel.cartTotal}",
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: size.height * 0.030),
        ],
      ),
    );
  }

  Widget _buildOrderRow(String label, String value,
      {FontWeight fontWeight = FontWeight.normal}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(fontWeight: fontWeight),
        ),
        Text(
          value,
          style: GoogleFonts.poppins(fontWeight: fontWeight),
        ),
      ],
    );
  }

  Widget _buildCheckoutButton() {
    final CartViewModel cartViewModel = s1<CartViewModel>();

    List<CartItemEntity> shoppingCart = cartViewModel.shoppingCart;

    if (shoppingCart.isNotEmpty) {
      return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.055,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/PaymentScreen');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurpleAccent,
            elevation: 0,
            shape: RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Center(
              child: Text(
            "CHECKOUT",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          )),
        ),
      );
    } else {
      return Container();
    }
  }
}
