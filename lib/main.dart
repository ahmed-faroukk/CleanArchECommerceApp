import 'package:ecommerce_clean_arch/features/Cart/presentation/ViewModel/CartViewModel.dart';
import 'package:ecommerce_clean_arch/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

import 'comfig/routes/AppRoutes.dart';
import 'di.dart';

void main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeAppDependencies();

  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider<CartViewModel>(
        create: (_) => CartViewModel(cartUseCases: s1()), // Access the instance using Get.find
      ),
    ],
    child: const MyApp(),
    )
  );
  ControllerInit.init();

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.onGenerateRoutes,
      home: Scaffold(body: SplashScreen(),),
    );
  }
}
