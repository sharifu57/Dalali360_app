import 'dart:ui';

import 'package:dalali360_app/config.dart';
import 'package:dalali360_app/controllers/categoryController.dart';
import 'package:dalali360_app/controllers/propertyController.dart';
import 'package:dalali360_app/views/pages/property/more_images.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class ViewProperty extends GetView<PropertyController> {
  ViewProperty({Key? key}) : super(key: key);
  CategoryController categoryController = Get.put(CategoryController());
  PropertyController propertyController = Get.put(PropertyController());
  final Uri _url = Uri.parse('https://flutter.dev');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Stack(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height / 2.1,
                    color: Color.fromARGB(255, 106, 103, 151),
                    child: Get.arguments['image'] != null
                        ? Obx(() => CarouselSlider.builder(
                              itemCount: propertyController.images.length,
                              options: CarouselOptions(
                                height:
                                    MediaQuery.of(context).size.height / 2.1,
                                enlargeCenterPage: true,
                                autoPlay: true,
                                aspectRatio: 16 / 9,
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enableInfiniteScroll: true,
                                autoPlayAnimationDuration:
                                    Duration(milliseconds: 1000),
                                viewportFraction: 1.0,
                              ),
                              itemBuilder: (BuildContext context, int itemIndex,
                                      int pageViewIndex) =>
                                  Card(
                                shape: RoundedRectangleBorder(
                                  side:
                                      BorderSide(color: Colors.white, width: 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 4,
                                child: Container(
                                  child: Get.arguments?['image'] == null
                                      ? Container(
                                          child: CircularProgressIndicator(
                                          color: Colors.black,
                                          strokeWidth: 1,
                                        ))
                                      : Image.network(
                                          '$path${Get.arguments?['image']}',
                                          fit: BoxFit.cover,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                        ),
                                ),
                              ),
                            ))
                        : Container(
                            child: Center(
                              child: Text('Empty Data'),
                            ),
                          ),
                  ),
                  Positioned(
                      top: 25,
                      left: 15,
                      child: Container(
                        padding: EdgeInsets.only(top: 15),
                        child: SizedBox(
                          height: 40,
                          width: 40,
                          child: Center(
                            child: Card(
                              color: Color(0xFF11101E),
                              child: Center(
                                child: IconButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    icon: Icon(
                                      Icons.arrow_back_ios_sharp,
                                      color: Colors.white,
                                      size: 12,
                                    )),
                              ),
                            ),
                          ),
                        ),
                      )),
                  Positioned(
                      top: 25,
                      right: 15,
                      child: Container(
                        padding: EdgeInsets.only(top: 15),
                        child: SizedBox(
                          height: 40,
                          child: GestureDetector(
                            onTap: () {
                              print("more images here to show=====");
                              print("${Get.arguments['id']}");
                              propertyController.getPropertyImages(
                                  int.parse(Get.arguments['id'].toString()));

                              Get.to(() => Images(),
                                  arguments: {}, preventDuplicates: true);
                            },
                            child: Center(
                              child: Card(
                                color: Colors.black,
                                child: Center(
                                  child: Container(
                                    padding:
                                        EdgeInsets.only(left: 10, right: 10),
                                    child: Text(
                                      "View More",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ))
                ],
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 5),
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${Get.arguments['name']}",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16),
                            ),
                            Row(
                              children: [
                                Text(
                                  "${Get.arguments['price']}",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(" Tzs")
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            Container(
                              child: Icon(
                                Icons.location_pin,
                                size: 11,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 5),
                              child: Text(
                                "${Get.arguments['ward']}",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(left: 5, top: 10),
                              child: const Text(
                                "Description",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 5, top: 7),
                              child: SingleChildScrollView(
                                  child: Get.arguments['description'] == null
                                      ? Container(
                                          padding: const EdgeInsets.all(20),
                                          child: const Center(
                                            child: Text(
                                                "No Details (please contact your Dalali)"),
                                          ),
                                        )
                                      : Text(
                                          "${Get.arguments['description']}")),
                            )
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(top: 10, left: 5),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.only(left: 5, top: 10),
                                  child: Text(
                                    "Dalali",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 0),
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 2,
                                      child: Container(
                                        child: SizedBox(
                                          height: 70,
                                          width: 4,
                                          child: Card(
                                            color: const Color(0xff04172B),
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(100.0),
                                              ),
                                            ),
                                            child: Container(
                                              padding: const EdgeInsets.only(
                                                  left: 0, top: 0),
                                              child: Center(
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100.0),
                                                  child: Container(
                                                    child: Get.arguments[
                                                                'username'] ==
                                                            null
                                                        ? Container(
                                                            child: Text(
                                                              "Name",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          )
                                                        : Container(
                                                            child: Text(
                                                              "${Get.arguments['username'][0]}"
                                                                  .toUpperCase(),
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 25,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 8,
                                      child: Container(
                                        padding: EdgeInsets.only(left: 20),
                                        child: Column(
                                          children: [
                                            Container(
                                              child: Row(
                                                children: [
                                                  Container(
                                                    child: Text(
                                                      "First Name: ",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Text(
                                                        "${Get.arguments['first_name']}"),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(top: 5),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    child: Text(
                                                      "Username: ",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Text(
                                                        "${Get.arguments['username']}"),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(top: 5),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    child: Text(
                                                      "Email: ",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Text(
                                                        "${Get.arguments['email']}"),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )),
              Container(
                color: Colors.black,
                width: double.infinity,
                child: Center(
                  child: TextButton.icon(
                      onPressed: () {
                        propertyController
                            .getDalaliProfile(Get.arguments?['user_id']);

                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                  'Dalali Mobile Number',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                content: setupAlertDialoadContainer(),
                                actions: [
                                  TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'OK'),
                                      child: const Text(
                                        "CANCEL",
                                        style: TextStyle(color: Colors.red),
                                      ))
                                ],
                              );
                            });
                      },
                      icon: Icon(
                        Icons.phone_android,
                        color: Colors.white,
                        size: 15,
                      ),
                      label: Text(
                        "Request Phone".toUpperCase(),
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget setupAlertDialoadContainer() {
    return Container(
      height: 100.0, // Change as per your requirement
      width: 300.0,
      child: Obx((() => ListView.builder(
            shrinkWrap: true,
            itemCount: propertyController.profiles.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: Column(
                  children: [
                    Container(
                      child: Text("${Get.arguments?['phone']}") == null
                          ? const Center(
                              child: Text(
                                  "No Phone Number for Dalali please contact Administrator 0657871769"),
                            )
                          : Column(
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${propertyController.profiles[index].phone_number}',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Container(
                                        child: IconButton(
                                            onPressed: () {
                                              Clipboard.setData(ClipboardData(
                                                      text:
                                                          "${propertyController.profiles[index].phone_number}"))
                                                  .then((value) =>
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                              SnackBar(
                                                        backgroundColor:
                                                            Colors.blueAccent,
                                                        content: const Text(
                                                          'Phone number copied!',
                                                        ),
                                                        action: SnackBarAction(
                                                          label: 'Undo',
                                                          onPressed: () {},
                                                        ),
                                                      )));
                                            },
                                            icon: Icon(
                                              Icons.copy,
                                              color: Colors.black,
                                              size: 18,
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: ElevatedButton.icon(
                                            onPressed: () {},
                                            icon: Icon(Icons.message, size: 15),
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Color(0xFF162945),
                                                foregroundColor: Colors.white,
                                                elevation: 3),
                                            label: Text(
                                              "Send SMS",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                      ),
                                      Container(
                                        child: ElevatedButton.icon(
                                            onPressed: () {
                                              call(propertyController
                                                  .profiles[index]
                                                  .phone_number);
                                              // _launchUrl;
                                            },
                                            icon: Icon(Icons.call, size: 15),
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Color(0xFF162945),
                                                foregroundColor: Colors.white,
                                                elevation: 3),
                                            label: Text(
                                              "Call Dalali",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                    ),
                  ],
                ),
              );
            },
          ))),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  call(phoneNumber) async {
    if (!await launch("tel:$phoneNumber")) throw 'could not call';
  }

  showAlertDialog(BuildContext context) {
    title:
    Text("Notice");
  }
}
