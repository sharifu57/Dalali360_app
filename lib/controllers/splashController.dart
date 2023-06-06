import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';

import '../routes/app_routes.dart';

class SplashController extends GetxController {
  final getStorage = GetStorage();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    // if (getStorage.read("token") != null) {
    //   Future.delayed(const Duration(milliseconds: 3000), () {
    //     Get.offAllNamed(Routes.LOGIN);
    //   });
    // } else {
    //   Future.delayed(const Duration(microseconds: 5000), () {
    //     Get.offAllNamed(Routes.SPLASH);
    //   });
    // }
    super.onReady();
  }
}
