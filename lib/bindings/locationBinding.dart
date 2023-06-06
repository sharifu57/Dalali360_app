import 'package:dalali360_app/controllers/locationController.dart';
import 'package:get/get.dart';

class LocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LocationController>(LocationController());
  }
}
