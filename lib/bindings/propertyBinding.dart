import 'package:dalali360_app/controllers/propertyController.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class PropertyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<PropertyController>(PropertyController());
  }
}
