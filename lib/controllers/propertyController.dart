import 'dart:convert';
import 'dart:io';

import 'package:dalali360_app/config.dart';
import 'package:dalali360_app/controllers/upload.dart';
import 'package:dalali360_app/models/categoryModel.dart';
import 'package:dalali360_app/models/imageModel.dart';
import 'package:dalali360_app/models/profileModel.dart';
import 'package:dalali360_app/models/propertyModel.dart';
import 'package:dalali360_app/models/wardModel.dart';
import 'package:dalali360_app/views/pages/screens/screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class PropertyController extends GetxController {
  var properties = <Property>[].obs;
  var userProperties = <Property>[].obs;
  var featureds = <Property>[].obs;

  var profiles = <Profile>[].obs;
  var images = <Media>[].obs;
  var wards = <Ward>[].obs;
  var categories = <CategoryModel>[].obs;
  var isLoading = false.obs;
  String token = "NVp6FndyGyqbnuOUby8osGpVH2JqjVtfWfRHT8rG";
  final propertyKey = GlobalKey<FormState>();
  final Map<String, dynamic> formData = {};
  final box = GetStorage();

  String name = '';
  String price = '';
  String description = '';
  String distance = '';
  String ward = '';
  String category = '';
  var parking = 0.obs;
  var image = ''.obs;
  var selectedImageSize = ''.obs;
  String profile = '';
  var isVisible = false.obs;
  var isCreatingProperty = false.obs;

  var isPropertyImageSet = false.obs;

  getImage(ImageSource ImageSource) async {
    isVisible.value = true;
    final pickedFile = await ImagePicker().getImage(source: ImageSource);

    if (pickedFile != null) {
      image.value = pickedFile.path;
      selectedImageSize.value =
          '${((File(image.value)).lengthSync() / 1024 / 1024).toStringAsFixed(2)}Mb';
      print("====image here");
      print(image);
    } else {
      Get.snackbar('Error' 'No Image Selected', '',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  void removeImage() {
    isVisible.value = false;
  }

  void onSelected(String? value) {
    if (value != null) {
      // selectedWard = value;
      print("selected");
    }
  }

  String greeting() {
    var hour = TimeOfDay.now().hour;
    if (hour <= 12) {
      return 'Good Morning';
    }
    if (hour <= 17) {
      return 'Good Afternoon';
    }
    return 'Good Evening';
  }

  String? nameValidator(String value) {
    final nameRegExp =
        RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    // ignore: unrelated_type_equality_checks
    if (value.isEmpty) {
      return "Property $value is not a valid property/Null property";
    }
    return null;
  }

  String? priceValidator(String value) {
    if (value.isEmpty) {
      return "Please enter a price";
    }
    return null;
  }

  String? descriptionValidator(String value) {
    if (value.isEmpty || value.length <= 30) {
      return "Please describe more";
    }
    return null;
  }

  String? numberValidator(String value) {
    if (value.isEmpty) {
      return "Please required number of months";
    }
    return null;
  }

  @override
  void onInit() {
    // ignore: todo
    // TODO: implement onInit

    getFeatured();
    allWards();
    allCategories();
    super.onInit();
  }

  Future allCategories() async {
    try {
      var response = await Dio().get("${config['apiBaseUrl']!}/categories",
          options: Options(headers: {"Authorization": "Bearer $bearerToken"}));
      if (response.data != null) {
        if (response.statusCode == 200) {
          for (var category in response.data['data']) {
            categories.add(CategoryModel.fromJson(category));
          }
        }
      }
    } catch (e) {}
  }

  Future allWards() async {
    var dio = Dio();

    try {
      var response = await dio.get("${config['apiBaseUrl']!}/wards",
          options: Options(headers: {"Authorization": "Bearer $bearerToken"}));
      if (response.data != null) {
        if (response.statusCode == 200) {
          for (var ward in response.data['data']) {
            wards.add(Ward.fromJson(ward));
          }
        }
      }
    } catch (e) {}
  }

  Map? responseCreateProperty;

  Future createProperty() async {
    isLoading = true.obs;
    isCreatingProperty = true.obs;
    final isValid = propertyKey.currentState!.validate();

    if (isValid) {
      propertyKey.currentState?.save();
      responseCreateProperty = await updload(
        formData,
        image,
      );
    }
  }

  Future getFeatured() async {
    var response = await Dio().get("${config['apiBaseUrl']!}/featureds");

    if (response.statusCode == 200) {
      if (response.data != null) {
        for (var featured in response.data['data']) {
          featureds.add(Property.fromJson(featured));
        }
      }
    }
  }

  Future getPropertyImages(int propertyId) async {
    isLoading.value = false;
    images.clear();
    try {
      var response = await Dio()
          .get("${config['apiBaseUrl']!}/images_by_property_id/" "$propertyId");

      if (response.data != null) {
        if (response.statusCode == 200) {
          for (var image in response.data['data']) {
            images.add(Media.fromJson(image));
          }
        }
      }
    } catch (e) {
    }
  }

  // ignore: non_constant_identifier_names
  Future ViewOneProperty(int propertyId) async {
    properties.clear();
    try {
      var response = await Dio().get(
          "${config['apiBaseUrl']!}/properties/" "$propertyId",
          options: Options(headers: {"Authorization": "Bearer $bearerToken"}));
      if (response.statusCode == 200) {
        for (var property in response.data['data']) {
          properties.add(Property.fromJson(property));
        }
      }
    } catch (e) {}
  }

  Future getDalaliProfile(int userId) async {
    profiles.clear();
    var response =
        await Dio().get("${config['apiBaseUrl']!}/profile/" "$userId");
    if (response.statusCode == 200) {
      var profile = Profile.fromJson(response.data['data']);

      profiles.add(profile);
    }
  }

  Future propertiesByUserId(int userId) async {
    properties.clear();
    try {
      var response = await Dio().get(
          "${config['apiBaseUrl']!}/properties_by_userId/"
          "${box.read("id")}",
          options: Options(headers: {"Authorization": "Bearer $bearerToken"}));
      if (response.statusCode == 200) {
        for (var property in response.data['data']) {
          userProperties.add(Property.fromJson(property));
        }
      }
    } catch (e) {}
  }
}
