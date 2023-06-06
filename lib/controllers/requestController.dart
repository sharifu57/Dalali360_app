import 'dart:convert';

import 'package:dalali360_app/config.dart';
import 'package:dalali360_app/views/pages/screens/screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestController extends GetxController {
  final requestKey = GlobalKey<FormState>();
  final Map<String, dynamic> formData = {};

  String? phoneNumberValidator(String value) {
    if (value.isEmpty || value.length < 12 || value.length > 12) {
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

  String? numberValidator(String value) {
    if (value.isEmpty) {
      return 'price is empty or not a number.';
    }
    return null;
  }

  final full_name = ''.obs;
  final email = ''.obs;
  final phone = ''.obs;
  final price_from = ''.obs;
  final price_to = ''.obs;
  final location = ''.obs;
  final message = ''.obs;

  Future submitRequest() async {
    final isValid = requestKey.currentState!.validate();
    if (isValid) {
      requestKey.currentState?.save();
      var createRequest = jsonEncode({
        "full_name": formData['full_name'],
        "email": formData['email'],
        "phone": formData['phone'],
        "price_from": formData['price_from'],
        "price_to": formData['price_to'],
        "location": formData['location'],
        "message": formData['message'],
      });

      print(createRequest);

      var response = await Dio().post(
        "${config['apiBaseUrl']!}/create_request",
        data: createRequest,
      );

      if (response.statusCode == 201) {
        print("Success====");
        full_name.value = '';
        email.value = '';
        phone.value = '';
        price_from.value = '';
        price_to.value = '';
        location.value = '';
        message.value = '';
        update();
        Get.defaultDialog(
          title: 'Success',
          middleText: 'Request successfully sent!',
          textConfirm: 'OK',
          onConfirm: () {
            // Get.back();
            Get.to(Screen());
          },
        );
      } else {
        Get.defaultDialog(
          title: 'Error',
          middleText: 'Failed to send data!',
          barrierDismissible: false,
          confirm: TextButton(
            onPressed: () => Get.back(),
            child: Text('OK'),
          ),
        );
      }
    }
  }
}
