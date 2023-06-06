import 'dart:io';

import 'package:dalali360_app/models/locationModel.dart';
import 'package:dio/dio.dart';
import 'package:external_path/external_path.dart';
import 'package:get/state_manager.dart';

class SearchController extends GetxController {
  RxString query = ''.obs;
  RxList results = <String>[].obs;
  var locations = <Location>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void search(String value) {
    query.value = value;
    results.value = locations
        .where((element) =>
            element.name!.toLowerCase().contains(value.toLowerCase()))
        .toList();
  }
}
