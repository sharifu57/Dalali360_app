import 'package:dalali360_app/controllers/homeController.dart';
import 'package:dalali360_app/controllers/locationController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Messages extends GetView<HomeController> {
  Messages({super.key});
  final box = GetStorage();
  LocationController locationController = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return box.read("token") == null
        ? Container(
            child: Center(
              child: Text("Login First"),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xFF162945),
              title: Center(
                child: Text("Chats"),
              ),
              actions: [
                Container(
                  child: Text("."),
                )
              ],
            ),
            body: Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Container(
                      padding: const EdgeInsets.only(top: 10),
                      child: SizedBox(
                        child: Card(),
                      )),
                ],
              ),
            ),
          );
  }
}
