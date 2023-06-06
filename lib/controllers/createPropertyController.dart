import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get_connect/http/src/multipart/multipart_file.dart';

class CreatePropertyController extends GetxController {
  final propertyKey = GlobalKey<FormState>();
  final Map<String, dynamic> formData = {};
  final box = GetStorage();
  var isVisible = false.obs;
  var image = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
