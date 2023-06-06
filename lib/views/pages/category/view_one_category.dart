import 'package:dalali360_app/config.dart';
import 'package:dalali360_app/controllers/categoryController.dart';
import 'package:dalali360_app/controllers/propertyController.dart';
import 'package:dalali360_app/views/pages/property/view_one_property.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class Category extends GetView<CategoryController> {
  Category({Key? key}) : super(key: key);
  CategoryController categoryController = Get.put(CategoryController());
  PropertyController propertyController = Get.put(PropertyController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF11101E),
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.white,
                  size: 17,
                )),
            title: Center(
              child: Get.arguments?['name'] == null
                  ? Container(
                      child: Text("No Name"),
                    )
                  : Text(
                      "${Get.arguments!['name']}",
                      style: TextStyle(fontSize: 12),
                    ),
            ),
            actions: [
              PopupMenuButton(
                  initialValue: categoryController.limit,
                  onSelected: (value) =>
                      categoryController.changeTotalPerPage(value),
                  itemBuilder: (context) {
                    return [
                      CheckedPopupMenuItem(
                        value: 15,
                        checked: categoryController.limit == 15,
                        child: Text("15 / pagination"),
                      ),
                      CheckedPopupMenuItem(
                        value: 25,
                        checked: categoryController.limit == 25,
                        child: Text("25 / pagination"),
                      ),
                      CheckedPopupMenuItem(
                        value: 50,
                        checked: categoryController.limit == 50,
                        child: Text("50 / pagination"),
                      )
                    ];
                  })
            ],
          ),
          body: categoryController.properties.isEmpty
              ? Container(
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.only(top: 200),
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                            child: SpinKitChasingDots(
                          color: Color(0xFF162945),
                          size: 30.0,
                        )),
                        Container(
                          padding: EdgeInsets.only(top: 20),
                          child: Text("Sorry No Data Available.."),
                        )
                      ],
                    ),
                  ),
                )
              : Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Container(
                          padding: EdgeInsets.only(top: 10),
                          child: SizedBox(
                            child: Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                    hintText: 'Search',
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 12),
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: Colors.grey,
                                      size: 13,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor:
                                        Color.fromARGB(255, 249, 252, 255)),
                              ),
                            ),
                          )),
                      Container(
                        padding: EdgeInsets.only(
                            top: 20, bottom: 10, left: 5, right: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                "Properties",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              child: Obx(() => Text(
                                  "${categoryController.properties.length}")),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Expanded(
                            child: Obx(
                          () => GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.75,
                                mainAxisSpacing: 5.0,
                                crossAxisSpacing: 7.0,
                              ),
                              itemCount: categoryController.properties.length,
                              itemBuilder: (BuildContext context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(() => ViewProperty(),
                                        arguments: {
                                          "id": categoryController
                                              .properties[index].id,
                                          "name": categoryController
                                              .properties[index].name,
                                          "price": categoryController
                                              .properties[index].price,
                                          "ward": categoryController
                                              .properties[index].ward?.name,
                                          "distance": categoryController
                                              .properties[index].distance,
                                          "parking": categoryController
                                              .properties[index].parking,
                                          "fence": categoryController
                                              .properties[index].fence,
                                          "ulinzi": categoryController
                                              .properties[index].ulinzi,
                                          "image": categoryController
                                              .properties[index].image,
                                          "luku": categoryController
                                              .properties[index].luku,
                                          "username": categoryController
                                              .properties[index].user?.username,
                                          "first_name": categoryController
                                              .properties[index]
                                              .user
                                              ?.first_name,
                                          "email": categoryController
                                              .properties[index].user?.email,
                                          "user_id": categoryController
                                              .properties[index].user?.id
                                        },
                                        preventDuplicates: true);
                                  },
                                  child: SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 5,
                                    child: Card(
                                      elevation: 2,
                                      color: Color(0xFF11101E),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Column(
                                        children: [
                                          Expanded(
                                              child: Container(
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              child: Container(
                                                  padding: EdgeInsets.all(5),
                                                  child: Stack(
                                                    children: [
                                                      Container(
                                                        child: categoryController
                                                                    .properties[
                                                                        index]
                                                                    .image ==
                                                                null
                                                            ? Container(
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/d360.jpg',
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                                ),
                                                              )
                                                            : Image.network(
                                                                '$path${categoryController.properties[index].image}',
                                                                fit: BoxFit
                                                                    .cover,
                                                                height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height,
                                                              ),
                                                      ),
                                                    ],
                                                  )),
                                            ),
                                          )),
                                          Container(
                                            child: SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  10,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: Card(
                                                  color: Color(0xFF11101E),
                                                  child: Container(
                                                    padding: EdgeInsets.all(5),
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 5),
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                "price",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        11),
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    "${categoryController.properties[index].price}",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            11),
                                                                  ),
                                                                  Container(
                                                                    padding: EdgeInsets
                                                                        .only(
                                                                            left:
                                                                                2),
                                                                    child:
                                                                        const Text(
                                                                      "Tsh",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize:
                                                                              11),
                                                                    ),
                                                                  )
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          child: Flexible(
                                                            child: Container(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 10),
                                                              child: Row(
                                                                children: [
                                                                  Container(
                                                                    child: Icon(
                                                                      Icons
                                                                          .location_city_rounded,
                                                                      color: Colors
                                                                          .grey,
                                                                      size: 15,
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    child: Text(
                                                                      "${categoryController.properties[index].ward?.name}",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.grey),
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
                        )),
                      ),
                    ],
                  )),
        ));
  }
}
