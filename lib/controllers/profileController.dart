import 'package:dalali360_app/config.dart';
import 'package:dalali360_app/models/customerModel.dart';
import 'package:dalali360_app/models/propertyModel.dart';
import 'package:dalali360_app/models/wardModel.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final loginKey = GlobalKey<FormState>();
  final Map<String, dynamic> formData = {};
  late SingleValueDropDownController _cnt;
  var wards = <Ward>[].obs;
  late final selected = "".obs;
  final box = GetStorage();
  var properties = <Property>[].obs;
  var userProperties = <Property>[].obs;
  var customers = <Customer>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    allWards();
    // propertiesByUserId(int.parse(box.read("id").toString()));
    // customersByUserId(int.parse(box.read("id").toString()));
    super.onInit();
  }

  void onSelected(String? value) {
    if (value != null) {
      selected.value = value;
    } else {}
  }

  Future allWards() async {
    var dio = Dio();
    Response response;
    try {
      Response response = await dio.get("${config['apiBaseUrl']!}/wards",
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

  String? dateTimeValidator(String value) {
    if (value.isEmpty || value.isEmpty) {
      return "Please enter Date";
    }
    return null;
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
          properties.add(Property.fromJson(property));
        }
      }
    } catch (e) {}
  }

  Future customersByUserId(int userId) async {
    customers.clear();
    try {
      var response = await Dio().get(
          "${config['apiBaseUrl']!}/customers_by_user_id/" "${box.read("id")}",
          options: Options(headers: {"Authorization": "Bearer $bearerToken"}));

      for (var customer in response.data['data']) {
        customers.add(Customer.fromJson(customer));
      }
    } catch (e) {
      print(e);
    }
  }
}
