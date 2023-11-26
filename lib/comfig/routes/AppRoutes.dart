
import 'package:ecommerce_clean_arch/features/register/presentation/pages/RegisterOptions.dart';
import 'package:ecommerce_clean_arch/features/register/presentation/pages/loginPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../features/register/presentation/pages/RegisterPage.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {

      case '/RegisterOptions':
        return _materialRoute(const RegisterOptions());

      case '/RegisterScreen':
        return _materialRoute( const RegisterScreen());

      case '/LoginScreen':
        return _materialRoute( const LoginScreen());

      default:
        return _materialRoute(const RegisterOptions());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}