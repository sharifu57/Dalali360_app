import 'package:dalali360_app/controllers/searchController.dart';
import 'package:get/instance_manager.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SearchController>(SearchController());
  }
}
