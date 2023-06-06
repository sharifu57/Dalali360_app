import 'package:dalali360_app/config.dart';
import 'package:dalali360_app/controllers/customerController.dart';
import 'package:dalali360_app/controllers/locationController.dart';
import 'package:dalali360_app/controllers/propertyController.dart';
import 'package:dalali360_app/views/pages/dalali/view_dalali_info.dart';
import 'package:dalali360_app/views/pages/property/view_one_property.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewLocation extends GetView<PropertyController> {
  ViewLocation({Key? key}) : super(key: key);
  LocationController locationController = Get.put(LocationController());
  PropertyController propertyController = Get.put(PropertyController());
  CustomerController customerController = Get.put(CustomerController());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff04172B),
            centerTitle: true,
            title: Center(),
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.white,
                  size: 17,
                )),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notification_important_sharp,
                    size: 20,
                    color: Colors.white,
                  ))
            ],
            bottom: PreferredSize(
                child: TabBar(
                  isScrollable: true,
                  unselectedLabelColor: Colors.white.withOpacity(0.3),
                  indicatorColor: Colors.white,
                  tabs: [
                    Tab(
                      child: Text(
                        'Properties'.toUpperCase(),
                        style: TextStyle(fontSize: 11),
                      ),
                    ),
                    Tab(
                      child: Text('Dalali'.toUpperCase(),
                          style: TextStyle(fontSize: 11)),
                    ),
                  ],
                ),
                preferredSize: Size.fromHeight(30.0)),
          ),
          body: Obx(() => TabBarView(
                children: <Widget>[
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: locationController.properties.isEmpty
                        ? Container(
                            height: MediaQuery.of(context).size.height,
                            padding: EdgeInsets.only(top: 200),
                            child: Center(
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.block,
                                    size: 100,
                                  ),
                                  Container(
                                    child: Text("Sorry No Data Available.."),
                                  )
                                ],
                              ),
                            ),
                          )
                        : Container(
                            color: Colors.white,
                            height: MediaQuery.of(context).size.height,
                            padding: EdgeInsets.fromLTRB(15, 0, 15, 10),
                            child: Column(
                              children: [
                                Container(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Card(
                                      child: TextField(
                                        decoration: InputDecoration(
                                            hintText: 'Search',
                                            hintStyle: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12),
                                            prefixIcon: Icon(
                                              Icons.search,
                                              color: Colors.grey,
                                              size: 13,
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide.none,
                                            ),
                                            filled: true,
                                            fillColor: Color.fromARGB(
                                                255, 249, 252, 255)),
                                      ),
                                    )),
                                Container(
                                  padding: EdgeInsets.only(
                                      top: 20, left: 5, right: 5, bottom: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Text(
                                          "Properties",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              child: Text("Filter By: "),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                  padding:
                                                      EdgeInsets.only(right: 5),
                                                  child: Text("Cat"),
                                                ),
                                                Container(
                                                  child: Text("Prc"),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                    // ignore: unnecessary_null_comparison
                                    child: locationController.properties == null
                                        ? Container(
                                            child: Center(
                                                child: Column(
                                              children: [
                                                Container(
                                                  child: Icon(
                                                    Icons.android_rounded,
                                                    color: Color(0xFF11101E),
                                                    size: 10,
                                                  ),
                                                ),
                                                Container(
                                                  child: Text(
                                                      "Ops, No properties found for this Location"),
                                                )
                                              ],
                                            )),
                                          )
                                        : Container(
                                            child: Obx(
                                            () => GridView.builder(
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                  childAspectRatio: 0.75,
                                                  mainAxisSpacing: 5.0,
                                                  crossAxisSpacing: 7.0,
                                                ),
                                                itemCount: locationController
                                                    .properties.length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        index) {
                                                  return GestureDetector(
                                                    onTap: () {
                                                      print(locationController
                                                          .profiles[index]
                                                          .phone_number);
                                                      print("***profiles ID");
                                                      propertyController
                                                          .getPropertyImages(int.parse(
                                                              locationController
                                                                  .properties[
                                                                      index]
                                                                  .id!
                                                                  .toString()));

                                                      Get.to(
                                                          () => ViewProperty(),
                                                          arguments: {
                                                            "id":
                                                                locationController
                                                                    .properties[
                                                                        index]
                                                                    .id,
                                                            "name":
                                                                locationController
                                                                    .properties[
                                                                        index]
                                                                    .name,
                                                            "price":
                                                                locationController
                                                                    .properties[
                                                                        index]
                                                                    .price,
                                                            "description":
                                                                locationController
                                                                    .properties[
                                                                        index]
                                                                    .description,
                                                            "ward":
                                                                locationController
                                                                    .properties[
                                                                        index]
                                                                    .ward
                                                                    ?.name,
                                                            "distance":
                                                                locationController
                                                                    .properties[
                                                                        index]
                                                                    .distance,
                                                            "parking":
                                                                locationController
                                                                    .properties[
                                                                        index]
                                                                    .parking,
                                                            "fence":
                                                                locationController
                                                                    .properties[
                                                                        index]
                                                                    .fence,
                                                            "ulinzi":
                                                                locationController
                                                                    .properties[
                                                                        index]
                                                                    .ulinzi,
                                                            "image":
                                                                locationController
                                                                    .properties[
                                                                        index]
                                                                    .image,
                                                            "luku":
                                                                locationController
                                                                    .properties[
                                                                        index]
                                                                    .luku,
                                                            "username":
                                                                locationController
                                                                    .properties[
                                                                        index]
                                                                    .user
                                                                    ?.username,
                                                            "first_name":
                                                                locationController
                                                                    .properties[
                                                                        index]
                                                                    .user
                                                                    ?.first_name,
                                                            "email":
                                                                locationController
                                                                    .properties[
                                                                        index]
                                                                    .user
                                                                    ?.email,
                                                            "user_id":
                                                                locationController
                                                                    .properties[
                                                                        index]
                                                                    .user
                                                                    ?.id,
                                                            "phone":
                                                                locationController
                                                                    .profiles[
                                                                        index]
                                                                    .phone_number,
                                                          },
                                                          preventDuplicates:
                                                              true);
                                                    },
                                                    child: SizedBox(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              5,
                                                      child: Card(
                                                        elevation: 2,
                                                        color:
                                                            Color(0xFF11101E),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: Column(
                                                          children: [
                                                            Expanded(
                                                                child:
                                                                    ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              child: locationController
                                                                          .properties[
                                                                              index]
                                                                          .image ==
                                                                      null
                                                                  ? Container(
                                                                      child: Image
                                                                          .asset(
                                                                        'assets/images/def.jpg',
                                                                        fit: BoxFit
                                                                            .contain,
                                                                        width: MediaQuery.of(context)
                                                                            .size
                                                                            .width,
                                                                        height: MediaQuery.of(context)
                                                                            .size
                                                                            .height,
                                                                      ),
                                                                    )
                                                                  : Container(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              5),
                                                                      child:
                                                                          Stack(
                                                                        children: [
                                                                          Container(
                                                                            child:
                                                                                Image.network(
                                                                              '$path${locationController.properties[index].image}',
                                                                              fit: BoxFit.cover,
                                                                              height: MediaQuery.of(context).size.height,
                                                                            ),
                                                                          ),
                                                                          Positioned(
                                                                              top: 0,
                                                                              right: 0,
                                                                              child: Container(
                                                                                child: Card(
                                                                                  color: Colors.red,
                                                                                  child: Container(
                                                                                      padding: EdgeInsets.all(5),
                                                                                      child: Text(
                                                                                        "${locationController.properties[index].category?.name}}",
                                                                                        style: TextStyle(fontSize: 10),
                                                                                      )),
                                                                                ),
                                                                              ))
                                                                        ],
                                                                      )),
                                                            )),
                                                            Container(
                                                              child: SizedBox(
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height /
                                                                    10,
                                                                width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                                child: Card(
                                                                    color: Color(
                                                                        0xFF11101E),
                                                                    child:
                                                                        Container(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              5),
                                                                      alignment:
                                                                          Alignment
                                                                              .centerLeft,
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          Container(
                                                                            padding:
                                                                                EdgeInsets.only(top: 5),
                                                                            alignment:
                                                                                Alignment.centerLeft,
                                                                            child:
                                                                                Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Text(
                                                                                  "price",
                                                                                  style: TextStyle(color: Colors.white, fontSize: 11),
                                                                                ),
                                                                                Row(
                                                                                  children: [
                                                                                    Text(
                                                                                      "${locationController.properties[index].price}",
                                                                                      style: TextStyle(color: Colors.white, fontSize: 11),
                                                                                    ),
                                                                                    Container(
                                                                                      padding: EdgeInsets.only(left: 2),
                                                                                      child: const Text(
                                                                                        "Tsh",
                                                                                        style: TextStyle(color: Colors.white, fontSize: 11),
                                                                                      ),
                                                                                    )
                                                                                  ],
                                                                                )
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            child:
                                                                                Flexible(
                                                                              child: Container(
                                                                                padding: EdgeInsets.only(top: 10),
                                                                                child: Row(
                                                                                  children: [
                                                                                    Container(
                                                                                      child: Icon(
                                                                                        Icons.location_city_rounded,
                                                                                        color: Colors.grey,
                                                                                        size: 15,
                                                                                      ),
                                                                                    ),
                                                                                    Container(
                                                                                      child: Text(
                                                                                        "${locationController.properties[index].ward?.name}",
                                                                                        style: TextStyle(color: Colors.grey),
                                                                                      ),
                                                                                    )
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    )),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }),
                                          ))),
                              ],
                            ),
                          ),
                  ),
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: locationController.profiles.isEmpty
                        ? Container(
                            height: MediaQuery.of(context).size.height,
                            padding: EdgeInsets.only(top: 200),
                            child: Center(
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.block,
                                    size: 100,
                                  ),
                                  Container(
                                    child: Text("Sorry No Data Available.."),
                                  )
                                ],
                              ),
                            ),
                          )
                        : Container(
                            color: Colors.white,
                            height: MediaQuery.of(context).size.height,
                            padding: EdgeInsets.fromLTRB(15, 0, 15, 10),
                            child: Column(
                              children: [
                                Container(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Card(
                                      child: TextField(
                                        decoration: InputDecoration(
                                            hintText: 'Search',
                                            hintStyle: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12),
                                            prefixIcon: Icon(
                                              Icons.search,
                                              color: Colors.grey,
                                              size: 13,
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide.none,
                                            ),
                                            filled: true,
                                            fillColor: Color.fromARGB(
                                                255, 249, 252, 255)),
                                      ),
                                    )),
                                Expanded(
                                    child: SingleChildScrollView(
                                  physics: BouncingScrollPhysics(),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(
                                            top: 10, bottom: 5, left: 5),
                                        child: Row(
                                          children: [
                                            Container(
                                              child: Text(
                                                "Dalali",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          shrinkWrap: true,
                                          itemCount: locationController
                                              .profiles.length,
                                          itemBuilder: ((context, index) {
                                            return Container(
                                                padding: EdgeInsets.only(
                                                    left: 5, right: 5),
                                                child: SizedBox(
                                                  height: 75,
                                                  child: GestureDetector(
                                                    onTap: (() {
                                                      customerController
                                                          .getCustomersByDalaliId(
                                                              int.parse(
                                                                  locationController
                                                                      .profiles[
                                                                          index]
                                                                      .user!
                                                                      .id
                                                                      .toString()));

                                                      Get.to(() => ViewDalali(),
                                                          arguments: {
                                                            "id":
                                                                locationController
                                                                    .profiles[
                                                                        index]
                                                                    .user
                                                                    ?.id,
                                                            "first_name":
                                                                locationController
                                                                    .profiles[
                                                                        index]
                                                                    .user
                                                                    ?.first_name,
                                                            "last_name":
                                                                locationController
                                                                    .profiles[
                                                                        index]
                                                                    .user
                                                                    ?.last_name,
                                                            "username":
                                                                locationController
                                                                    .profiles[
                                                                        index]
                                                                    .user
                                                                    ?.username,
                                                            "email":
                                                                locationController
                                                                    .profiles[
                                                                        index]
                                                                    .user
                                                                    ?.email,
                                                            "phone":
                                                                locationController
                                                                    .profiles[
                                                                        index]
                                                                    .phone_number,
                                                            "dalali_number":
                                                                locationController
                                                                    .profiles[
                                                                        index]
                                                                    .dalali_number,
                                                            "about":
                                                                locationController
                                                                    .profiles[
                                                                        index]
                                                                    .about,
                                                            "picture":
                                                                locationController
                                                                    .profiles[
                                                                        index]
                                                                    .picture,
                                                            "location_name":
                                                                locationController
                                                                    .wards[
                                                                        index]
                                                                    .name
                                                          });
                                                    }),
                                                    child: Card(
                                                      elevation: 2,
                                                      color: Color(0xFF162945),
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                              flex: 2,
                                                              child: Container(
                                                                  child:
                                                                      Container(
                                                                child: SizedBox(
                                                                  height: 70,
                                                                  width: 0,
                                                                  child: Card(
                                                                    color: Color(
                                                                        0xff04172B),
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .all(
                                                                        Radius.circular(
                                                                            100.0),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      padding: EdgeInsets.only(
                                                                          left:
                                                                              0,
                                                                          top:
                                                                              0),
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(100.0),
                                                                          child:
                                                                              Container(
                                                                            child: locationController.profiles[index].picture == null
                                                                                ? Container(
                                                                                    child: locationController.profiles[index].user?.first_name == null
                                                                                        ? Container(
                                                                                            child: const Icon(
                                                                                              Icons.cancel,
                                                                                              color: Colors.red,
                                                                                            ),
                                                                                          )
                                                                                        : Text(""),
                                                                                  )
                                                                                : Image.network(
                                                                                    '$path${locationController.profiles[index].picture}',
                                                                                    fit: BoxFit.cover,
                                                                                    height: MediaQuery.of(context).size.height,
                                                                                  ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ))),
                                                          Expanded(
                                                              flex: 6,
                                                              child: Container(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        top: 13,
                                                                        left:
                                                                            5),
                                                                child: Column(
                                                                  children: [
                                                                    Container(
                                                                      alignment:
                                                                          Alignment
                                                                              .centerLeft,
                                                                      child: locationController.profiles[index].user?.first_name ==
                                                                              null
                                                                          ? Row(
                                                                              children: [
                                                                                Container(
                                                                                  padding: const EdgeInsets.only(right: 5),
                                                                                  child: Text(
                                                                                    "${locationController.profiles[index].user?.first_name}",
                                                                                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  "${locationController.profiles[index].user?.last_name}",
                                                                                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
                                                                                )
                                                                              ],
                                                                            )
                                                                          : Container(
                                                                              child: Text("${locationController.profiles[index].user?.username}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17)),
                                                                            ),
                                                                    ),
                                                                    Container(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          top:
                                                                              5),
                                                                      alignment:
                                                                          Alignment
                                                                              .centerLeft,
                                                                      child:
                                                                          Text(
                                                                        "${locationController.profiles[index].phone_number}",
                                                                        style: const TextStyle(
                                                                            color:
                                                                                Colors.white),
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              )),
                                                          Expanded(
                                                              flex: 2,
                                                              child: Container(
                                                                  child:
                                                                      SizedBox(
                                                                height: 50,
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () {
                                                                    Get.to(
                                                                        () =>
                                                                            ViewDalali(),
                                                                        arguments: {
                                                                          "id": locationController
                                                                              .profiles[index]
                                                                              .user
                                                                              ?.id,
                                                                          "first_name": locationController
                                                                              .profiles[index]
                                                                              .user
                                                                              ?.first_name,
                                                                          "last_name": locationController
                                                                              .profiles[index]
                                                                              .user
                                                                              ?.last_name,
                                                                          "email": locationController
                                                                              .profiles[index]
                                                                              .user
                                                                              ?.email,
                                                                          "phone": locationController
                                                                              .profiles[index]
                                                                              .phone_number,
                                                                          "dalali_number": locationController
                                                                              .profiles[index]
                                                                              .dalali_number,
                                                                          "about": locationController
                                                                              .profiles[index]
                                                                              .about,
                                                                          "picture": locationController
                                                                              .profiles[index]
                                                                              .picture
                                                                        });
                                                                  },
                                                                  child: const Card(
                                                                      color: Color(0xFF162945),
                                                                      child: Icon(
                                                                        Icons
                                                                            .arrow_forward_ios_rounded,
                                                                        color: Colors
                                                                            .grey,
                                                                        size:
                                                                            10,
                                                                      )),
                                                                ),
                                                              )))
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ));
                                          })),
                                    ],
                                  ),
                                ))
                              ],
                            ),
                          ),
                  ),
                ],
              ))),
    );
  }

  Widget viewDalaliInformation() {
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
                      child: propertyController.profiles[index].phone_number ==
                              null
                          ? Container(
                              child: const Center(
                                child: Text(
                                    "No Phone Number for Dalali please contact Administrator 0657871769"),
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${propertyController.profiles[index].phone_number}',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container()
                              ],
                            ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.message, size: 15),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFF162945),
                                    foregroundColor: Colors.white,
                                    elevation: 3),
                                label: Text(
                                  "Send SMS",
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
              );
            },
          ))),
    );
  }
}
