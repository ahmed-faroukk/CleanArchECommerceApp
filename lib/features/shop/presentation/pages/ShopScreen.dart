import 'package:ecommerce_clean_arch/features/shop/data/model/ProductModel.dart';
import 'package:ecommerce_clean_arch/features/shop/presentation/pages/ElectronicsScreen.dart';
import 'package:ecommerce_clean_arch/features/shop/presentation/pages/jeweleryScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../../../di.dart';
import '../../../Cart/presentation/ViewModel/CartViewModel.dart';
import 'MenClothesScreen.dart';
import 'PopularScreen.dart';
import 'WomenClothesScreen.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(
      length: 5,
      vsync: this,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildShopScreen(context);
  }

  Widget _buildShopScreen(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            backgroundColor: Colors.white,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF6342E8), Colors.white],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: _buildAppHeader(),
              ),
            ),
            bottom: TabBar(
              isScrollable: true,
              tabs: const [
                Tab(text: 'Popular'),
                Tab(text: 'Mens'),
                Tab(text: 'Womens'),
                Tab(text: 'Electronics'),
                Tab(text: 'Jewelry'),
              ],
              controller: controller,
              indicatorColor: Colors.black, // Set your desired indicator color
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: controller,
              children: const <Widget>[
                PopularScreen(),
                MenClothScreen(),
                WomenClothesScreen(),
                electronicsScreen(),
                JeweleryScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppHeader() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildTitleAndCart(),
      ],
    );
  }

  final cartViewModel = s1<CartViewModel>();

  Widget _buildTitleAndCart() {
    return Consumer<CartViewModel>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Geeta",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                fontFamily: 'Rubik',
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            Stack(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/CartScreen');
                  },
                  icon: const Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.white,
                  ),
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      cartViewModel.getCartSize().toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        fontFamily: 'Rubik',
                        color: Colors.deepPurpleAccent,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
