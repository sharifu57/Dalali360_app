import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../models/categoryModel.dart';

class HomeController extends GetxController {
  var categories = <CategoryModel>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
  }
}
