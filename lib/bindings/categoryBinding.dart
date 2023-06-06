import 'package:dalali360_app/controllers/categoryController.dart';
import 'package:get/instance_manager.dart';

class CategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CategoryController>(CategoryController());
  }
}
