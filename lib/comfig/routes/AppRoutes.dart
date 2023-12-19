
import 'package:ecommerce_clean_arch/features/register/presentation/pages/RegisterOptions.dart';
import 'package:ecommerce_clean_arch/features/register/presentation/pages/loginPage.dart';
import 'package:ecommerce_clean_arch/features/shop/domin/Entitiy/Product.dart';
import 'package:ecommerce_clean_arch/features/shop/presentation/pages/ProductDetailsScreen.dart';
import 'package:ecommerce_clean_arch/features/shop/presentation/pages/ShopScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../features/register/presentation/pages/RegisterPage.dart';
import '../../features/Cart/presentation/pages/CartScreen.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {

      case '/RegisterOptions':
        return _materialRoute(const RegisterOptions());

      case '/RegisterScreen':
        return _materialRoute( const RegisterScreen());

      case '/LoginScreen':
        return _materialRoute( const LoginScreen());

      case '/ShopScreen':
        return _materialRoute( const ShopScreen());

        case '/CartScreen':
        return _materialRoute( const CartScreen());

      case'/ProductDetails':
        return _materialRoute(
            ProductDetailWidget(product: settings.arguments as ProductsEntity )
        );

      default:
        return _materialRoute(const RegisterOptions());
    }
  }
  static PageRouteBuilder _materialRoute(Widget view) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return Builder(
          builder: (BuildContext context) => view,
        );
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = 0.0;
        const end = 1.0;
        const curve = Curves.easeInOutQuart;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var opacityAnimation = animation.drive(tween);
        return FadeTransition(opacity: opacityAnimation, child: child);
      },
      transitionDuration: const Duration(milliseconds: 500),
      reverseTransitionDuration: const Duration(milliseconds: 500),
    );
  }
}