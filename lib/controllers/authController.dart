import 'dart:convert';

import 'package:dalali360_app/config.dart';
import 'package:dalali360_app/views/pages/dalali/login.dart';
import 'package:dalali360_app/views/pages/dalali/register.dart';
import 'package:dalali360_app/views/pages/extras/editProfile.dart';
import 'package:dalali360_app/views/pages/screens/screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final loginKey = GlobalKey<FormState>();
  final Map<String, dynamic> formData = {};

  String name = '';
  String email = '';
  String phone_number = '';
  String password = '';
  String password_confirmation = '';

  var authResponse;

  String test = "true";
  var isLoading = false.obs;
  final box = GetStorage();

  final passwordTextController = TextEditingController();
  // var responseMessage = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
  }

  void displayErrorMessage(String message) {
    authResponse.value = message;
    update();
    clearResponseMessage();
  }

  Future<void> clearResponseMessage() async {
    await Future.delayed(Duration(seconds: 2));
    authResponse.value = '';
    update();
  }

  String? phoneNumberValidator(String value) {
    if (value.isEmpty || value.length < 10 || value.length > 10) {
      return "Phone Number is not valid";
    }
    return null;
  }

  String? nameValidator(String value) {
    final nameRegExp =
        RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    // ignore: unrelated_type_equality_checks
    if (value.isEmpty || value.length < 4) {
      return "Name is not valid";
    }
    return null;
  }

  String? emailValidator(String value) {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    // ignore: unrelated_type_equality_checks
    if (value.isEmpty || !value.contains('@')) {
      return 'Please enter a valid email address.';
    }
    return null;
  }

  String? passwordValidator(String value) {
    final passwordRegExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
    // ignore: unrelated_type_equality_checks
    if (value.isEmpty || value.length < 7) {
      return 'Password must be at least 7 characters long.';
    }
    return null;
  }

  String? confirmPasswordValidator(String value) {
    if (value != password || value.isEmpty) {
      return "Password Mismatch";
    }
    return null;
  }

  Future LoginDalali() async {
    print("***start login");
    final isValid = loginKey.currentState!.validate();
    Get.focusScope!.unfocus();
    isLoading.value = false;
    if (isValid) {
      loginKey.currentState!.save();
      var login_obj = jsonEncode({
        "username": formData['username'],
        "password": formData['password'],
      });
      print(login_obj);
      try {
        print("_____logged in");
        final response = await Dio().post("${config['apiBaseUrl']!}/login",
            data: login_obj,
            options:
                Options(headers: {"Authorization": "Bearer $bearerToken"}));
        print("_____log");
        print(response);
        if (response.data['status'] == 200) {
          Get.snackbar('Success: ' 'User Logged In successfully', '',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green,
              colorText: Colors.white);

          isLoading.value = true;

          box.write("id", response.data['user']['id']);
          box.write("token", response.data['token']);
          box.write("first_name", response.data['user']['first_name']);
          box.write("last_name", response.data['user']['last_name']);
          box.write("username", response.data['user']['username']);
          box.write("email", response.data['user']['email']);
          box.write("date_joined", response.data['user']['date_joined']);
          Get.to(() => Screen());
        } else if (response.data['status'] == 404) {
          // authResponse = response.data['message'];
          Get.snackbar('Error: ' 'Failed to login', '',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red,
              colorText: Colors.white);
        } else {
          authResponse = response.data['message'];
        }
      } catch (e) {
        print(e);
      }
    }
  }

  Future CreateDalali() async {
    final isValid = formKey.currentState!.validate();
    Get.focusScope!.unfocus();

    if (isValid) {
      formKey.currentState!.save();

      var dalali_obj = jsonEncode({
        "first_name": formData['first_name'],
        "last_name": formData['last_name'],
        "username": formData['username'],
        "email": formData['email'],
        "password": formData['password']
      });

      try {
        isLoading.value = false;
        final response = await Dio().post("${config['apiBaseUrl']!}/register",
            data: dalali_obj,
            options:
                Options(headers: {"Authorization": "Bearer $bearerToken"}));

        if (response.statusCode == 201) {
          Get.to(() => Login(), duration: const Duration(microseconds: 1000));
          GetSnackBar(
            title: 'Successfully!',
            message: 'User Registered Successfully',
            icon: const Icon(Icons.refresh),
            duration: const Duration(seconds: 3),
          );
        } else {
          isLoading.value = true;
          print("============= no data");
          print(response.data['message']);
          // box.write("id", response.data['user']['id']);
          // box.write("token", response.data['token']);
          // box.write("first_name", response.data['user']['first_name']);
          // box.write("last_name", response.data['user']['last_name']);
          // box.write("username", response.data['user']['username']);
          // box.write("email", response.data['user']['email']);
          // box.write("date_joined", response.data['user']['date_joined']);
          Get.to(Register(), duration: const Duration(microseconds: 3000));
        }
      } catch (e) {
        print(e);
      }
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final now = DateTime.now().obs;
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: now.value,
        firstDate: now.value,
        lastDate: DateTime(2101));
    if (picked != null && picked != now) {
      print('hello $picked');
    }
  }
}
