import 'package:ecommerce_clean_arch/comfig/theme/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

import 'di.dart';

void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
  ControllerInit.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return   const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Text(""),),
    );
  }
}
