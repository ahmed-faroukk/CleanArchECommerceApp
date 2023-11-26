
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import 'comfig/controller/NetworkController.dart';


final s1 = GetIt.instance ;

Future<void> initializeDependencies() async {



}

class ControllerInit  {

  static void init() {
    Get.put<NetworkController>(NetworkController(),permanent:true);
  }

}