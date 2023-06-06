import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dalali360_app/partials/errorPage.dart';
import 'package:dalali360_app/views/pages/splash.dart';
import 'package:get/get.dart';

class ConnectivityController extends GetxController {
  RxBool isConnected = true.obs;

  @override
  void onInit() {
    // TODO: implement onInithy
    super.onInit();
  }

  Future<void> checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.ethernet ||
        connectivityResult == ConnectivityResult.vpn) {
      isConnected.value = true;
      Get.offAll(Splash());
    } else {
      Get.offAll(ErrorPage());
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
}
