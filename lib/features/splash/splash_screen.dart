import 'package:ecommerce_clean_arch/features/register/presentation/pages/RegisterOptions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../register/presentation/pages/RegisterPage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashState();
}

class _SplashState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return _buildSplash();
  }
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => const RegisterOptions() ));
    });
  }

  Widget _buildSplash() {
    return Scaffold(
        body: Container(
      width: double.infinity,
       decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFF6342E8), Colors.white],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft)),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_cart , size: 120, color: Colors.white,),
          Text("Geeta Store.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.bold,
              )),
        ],
      ),
    ));
  }
}
